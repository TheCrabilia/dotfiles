---@type LazySpec
return {
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPost",
		dependencies = {
			"b0o/schemastore.nvim",
			"mfussenegger/nvim-lint",
			{ "j-hui/fidget.nvim", opts = {} },
			{
				"stevearc/conform.nvim",
				init = function()
					vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
				end,
			},
		},
		config = function()
			require("utils.lsp").setup_diagnostics()

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(event)
					local bufnr = event.buf

					local function map(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
					end

					map("gd", function()
						require("telescope.builtin").lsp_definitions()
					end, "Go to definition")
					map("gD", vim.lsp.buf.declaration, "Go to declaration")
					map("gi", function()
						require("telescope.builtin").lsp_implementations()
					end, "Go to implementation")
					map("gr", function()
						require("telescope.builtin").lsp_references()
					end, "List references")
					map("<leader>lr", vim.lsp.buf.rename, "Rename symbol")
					map("<leader>la", vim.lsp.buf.code_action, "Code action")
					map("<leader>ds", function()
						require("telescope.builtin").lsp_document_symbols()
					end, "Document symbols")
					map("<leader>ws", function()
						require("telescope.builtin").lsp_workspace_symbols()
					end, "Workspace symbols")
				end,
			})

			local capabilities = require("blink.cmp").get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())
			local handlers = require("utils.lsp").handlers()

			local servers = {
				lua_ls = {
					settings = {
						Lua = {
							runtime = { version = "LuaJIT" },
							diagnostics = {
								disable = { "undefined-doc-name", "missing-fields" },
								globals = { "vim" },
							},
							workspace = {
								checkThirdParty = false,
							},
							telemetry = {
								enable = false,
							},
							format = {
								enabled = false,
							},
						},
					},
				},
				gopls = {
					settings = {
						gopls = {
							staticcheck = true,
							hints = {
								assignVariableTypes = true,
								compositeLiteralFields = true,
								compositeLiteralTypes = true,
								constantValues = true,
								parameterNames = true,
								rangeVariableTypes = true,
							},
						},
					},
				},
				pyright = {
					settings = {
						pyright = {
							disableOrganizeImports = true,
						},
						python = {
							analysis = {
								typeCheckingMode = "basic",
								useLibraryCodeFroTypes = true,
								autoSearchPaths = true,
								autoImportCompletions = true,
								diagnosticMode = "workspace",
								diagnosticSeverityOverrides = {
									deprecateTypingAliases = true,
									reportUnusedClass = "warning",
									reportUnusedFunction = "warning",
								},
							},
						},
					},
				},
				yamlls = {
					settings = {
						yaml = {
							schemaStore = {
								enable = true,
								url = "https://www.schemastore.org/api/json/catalog.json",
							},
						},
					},
				},
				jsonls = {
					settings = {
						json = {
							schemas = require("schemastore").json.schemas(),
							validate = {
								enable = true,
							},
						},
					},
				},
				clangd = {
					capabilities = {
						offsetEncoding = { "utf-8" },
					},
					filetypes = { "c", "cpp", "objc", "objcpp" },
					init_options = {
						fallbackFlags = {
							"-I",
							"/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/c++/v1",
						},
					},
				},
			}

			local ensure_installed = vim.tbl_keys(servers or {})

			vim.list_extend(ensure_installed, {
				"stylua",
				"clang-format",
				"debugpy",
				"dockerls",
				"goimports",
				"tflint",
				"prettierd",
				"shellcheck",
			})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}

						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						server.handlers = vim.tbl_deep_extend("force", {}, handlers, server.handlers or {})
						server.flags = vim.tbl_deep_extend("force", { debounce_text_changes = 200 }, server.flags or {})

						require("lspconfig")[server_name].setup(server)
					end,
				},
			})

			-- Formatters setup
			local conform = require("conform")
			local map = vim.keymap.set

			conform.setup({
				notify_on_error = false,
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
					go = { "goimports", "gofumpt", "golines" },
					c = { "clang_format" },
					cpp = { "clang_format" },
					java = { "clang_format" },
					markdown = { "prettierd" },
					html = { "prettierd" },
					hcl = { "terraform_fmt" },
					terraform = { "terraform_fmt" },
					proto = { "buf" },
					typescript = { "prettierd" },
					javascript = { "prettierd" },
					css = { "prettierd" },
					templ = { "templ" },
					sql = { "sql_formatter" },
					["terraform-vars"] = { "terraform_fmt" },
					["_"] = { "trim_whitespace" },
				},
				formatters = {
					clang_format = {
						inherit = true,
						prepend_args = {
							"-style={BasedOnStyle: Google, UseTab: Always, IndentWidth: 4, TabWidth: 4, ColumnLimit: 120}",
						},
					},
					ruff_format = {
						inherit = true,
						args = {
							"format",
							"--force-exclude",
							"--line-length",
							"120",
							"--stdin-filename",
							"$FILENAME",
							"-",
						},
					},
					golines = {
						inherit = true,
						prepend_args = {
							"-m",
							"120",
							"--shorten-comments",
							"--reformat-tags",
						},
					},
					sql_formatter = {
						inherit = true,
						prepend_args = {
							"--config",
							[[{"keywordCase": "upper", "dataTypeCase": "upper", "functionCase": "upper"}]],
						},
					},
				},
			})

			map({ "n", "v" }, "<leader>lf", function()
				conform.format({ async = true, lsp_fallback = true })
			end, { desc = "Format buffer" })

			-- Linters setup
			local ok, lint = pcall(require, "lint")
			if ok then
				lint.linters_by_ft = {
					sh = { "shellcheck" },
					bash = { "shellcheck" },
					proto = { "buf_lint" },
					-- sql = { "sqlfluff" },
				}

				lint.linters.shellcheck.args = {
					"--format",
					"json",
					"--enable",
					"all",
					"-e",
					"SC2154",
					"-",
				}

				vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
					callback = function()
						lint.try_lint()
					end,
				})
			end
		end,
	},
	{
		"williamboman/mason.nvim",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		build = function()
			vim.cmd.MasonUpdate()
		end,
		opts = {
			ui = {
				border = "rounded",
			},
		},
	},
}
