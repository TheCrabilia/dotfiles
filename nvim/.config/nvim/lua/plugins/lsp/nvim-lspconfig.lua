return {
	"neovim/nvim-lspconfig",
	event = { "VeryLazy" },
	dependencies = {
		"nvim-web-devicons",
		"neodev.nvim",
		"cmp-nvim-lsp",
	},
	opts = function()
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		return {
			default = {
				on_attach = require("utils.lsp").on_attach,
				handlers = require("utils.lsp").handlers(),
				capabilities = capabilities,
				flags = {
					debounce_text_changes = 150,
				},
			},
			---@type lspconfig.options
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
								typeCheckingMode = "basic",
								useLibraryCodeFroTypes = true,
								autoSearchPaths = true,
								diagnosticMode = "workspace",
								diagnosticSeverityOverrides = {},
							},
						},
					},
				},
				ruff_lsp = {
					on_attach = function(client, bufnr)
						client.server_capabilities.hoverProvider = false
						require("utils.lsp").on_attach(client, bufnr)
					end,
					init_options = {
						settings = {
							args = {},
						},
					},
				},
				gopls = {
					settings = {
						gopls = {
							semanticTokens = true,
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
			},
		}
	end,
	config = function(_, opts)
		local lspconfig = require("lspconfig")

		lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, opts.default)

		for server_name, server_opts in pairs(opts.servers) do
			lspconfig[server_name].setup(server_opts)
		end
	end,
}
