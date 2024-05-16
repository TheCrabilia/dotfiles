---@type LazySpec
return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"williamboman/mason.nvim",
			build = function()
				vim.cmd.MasonUpdate()
			end,
		},
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"j-hui/fidget.nvim",
		"b0o/schemastore.nvim",
		{ "mfussenegger/nvim-lint", enabled = false },
		{
			"stevearc/conform.nvim",
			init = function()
				vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
			end,
		},
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		require("utils.lsp").setup_diagnostics()

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(event)
				local bufnr = event.buf
				-- local client = vim.lsp.get_client_by_id(event.data.client_id)
				local builtin = require("telescope.builtin")

				local function map(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
				end

				map("K", vim.lsp.buf.hover, "Open documentstion in floating window")
				map("gd", builtin.lsp_definitions, "Go to definition")
				map("gD", vim.lsp.buf.declaration, "Go to declaration")
				map("gi", builtin.lsp_implementations, "Go to implementation")
				map("gr", builtin.lsp_references, "List references")
				map("<leader>lr", vim.lsp.buf.rename, "Rename symbol")
				map("<leader>la", vim.lsp.buf.code_action, "Code action")
				map("<leader>ds", builtin.lsp_document_symbols, "Document symbols")
				map("<leader>ws", builtin.lsp_workspace_symbols, "Workspace symbols")
			end,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
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
			pyright = {
				settings = {
					pyright = {
						disableOrganizeImports = true,
					},
					python = {
						analysis = {
							typeCheckingMode = "strict",
							useLibraryCodeFroTypes = true,
							autoSearchPaths = true,
							diagnosticMode = "workspace",
							diagnosticSeverityOverrides = {
								reportUndefinedVariable = "none",
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
				init_options = {
					fallbackFlags = {
						"-I",
						"/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/c++/v1",
					},
				},
			},
			ruff_lsp = {
				capabilities = {
					hoverProvider = nil,
				},
			},
		}

		require("mason").setup()

		local ensure_installed = vim.tbl_keys(servers or {})

		vim.list_extend(ensure_installed, {
			"stylua",
			"clang-format",
			"debugpy",
			"dockerls",
			"goimports",
			"ruff",
			"tflint",
		})
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		require("neodev").setup()

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}

					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					server.handlers = vim.tbl_deep_extend("force", {}, handlers, server.handlers or {})
					server.flags = vim.tbl_deep_extend("force", { debounce_text_changes = 150 }, server.flags or {})

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
				python = { "ruff_fix", "ruff_format" },
				go = { "goimports", "gofmt" },
				c = { "clang_format" },
				cpp = { "clang_format" },
				java = { "clang_format" },
				markdown = { "prettierd" },
				html = { "prettierd" },
				hcl = { "terraform_fmt" },
				terraform = { "terraform_fmt" },
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
			},
		})

		map({ "n", "v" }, "<leader>lf", function()
			conform.format({ async = true, lsp_fallback = true })
		end, { desc = "Format buffer" })

		-- Linters setup
		local ok, lint = pcall(require, "lint")
		if ok then
			lint.linters_by_ft = {}

			vim.api.nvim_create_autocmd("BufWritePost", {
				callback = function()
					lint.try_lint()
				end,
			})
		end

		require("fidget").setup({
			notification = {
				window = {
					winblend = 0,
				},
			},
		})
	end,
}
