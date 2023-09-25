return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
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
					on_attach = function(client)
						client.server_capabilities.codeActionProvider = false
					end,
					handlers = vim.tbl_extend("force", require("utils.lsp").handlers(), {
						["textDocument/publishDiagnostics"] = function() end,
					}),
					settings = {
						pyright = {
							disableOrganizeImports = true,
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
				dockerls = {},
				marksman = {},
				terraformls = {},
				tflint = {},
				vimls = {},
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
