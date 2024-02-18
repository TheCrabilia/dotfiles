return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-cmp",
		"fidget.nvim",
		{ "folke/neodev.nvim", tag = "stable", opts = {} },
	},
	opts = function()
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		return {
			default = {
				handlers = require("utils.lsp").handlers(),
				capabilities = capabilities,
				flags = {
					debounce_text_changes = 150,
				},
			},
			servers = {
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
				ruff_lsp = {},
				gopls = {},
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
					capabilities = vim.tbl_extend("force", capabilities, {
						offsetEncoding = { "utf-16" },
					}),
				},
				dockerls = {},
				marksman = {},
				terraformls = {},
				tflint = {},
				vimls = {},
				html = {},
				sqls = {},
			},
		}
	end,
	config = function(_, opts)
		local lspconfig = require("lspconfig")

		lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, opts.default)

		for server_name, server_opts in pairs(opts.servers) do
			lspconfig[server_name].setup(server_opts)
		end

		vim.diagnostic.config({
			serverity_sort = true,
			signs = true,
			underline = true,
			update_in_insert = false,
			virtual_text = true,
		})
		local signs = { Error = "E ", Warn = "W ", Hint = "H ", Info = "I " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end

		-- Global mappings
		local map = vim.keymap.set
		map("n", "<leader>l/", vim.diagnostic.open_float)
		map("n", "[d", vim.diagnostic.goto_prev)
		map("n", "]d", vim.diagnostic.goto_next)

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(args)
				local bufnr = args.buf
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				---@diagnostic disable-next-line: redefined-local
				local opts = { buffer = bufnr }

				map("n", "K", vim.lsp.buf.hover, opts)
				map("n", "<C-k>", vim.lsp.buf.signature_help, opts)
				map("n", "gd", vim.lsp.buf.definition, opts)
				map("n", "gD", vim.lsp.buf.declaration, opts)
				map("n", "gi", vim.lsp.buf.implementation, opts)
				map("n", "gr", vim.lsp.buf.references, opts)
				map("n", "<leader>lr", vim.lsp.buf.rename, opts)
				map({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts)
				map("n", "<leader>lf", function()
					require("utils.lsp").lsp_format(bufnr)
				end, opts)

				-- Disable semantic token hightlighting
				client.server_capabilities.semanticTokensProvider = nil

				if client.name == "ruff_lsp" then
					client.server_capabilities.hoverProvider = false
				end
			end,
		})
	end,
}
