return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "folke/neoconf.nvim", cmd = "Neoconf", config = true, enabled = false },
			{ "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
		},
	},
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		dependencies = {
			{ "jay-babu/mason-nvim-dap.nvim" },
			{
				"WhoIsSethDaniel/mason-tool-installer.nvim",
				lazy = false,
				opts = {
					ensure_installed = {
						-- Language servers
						"actionlint",
						"bash-language-server",
						"gopls",
						"html-lsp",
						"jdtls",
						"json-lsp",
						"lua-language-server",
						"marksman",
						"nginx-language-server",
						"pyright",
						"ruff-lsp",
						"terraform-ls",
						"vim-language-server",

						-- Formatters
						"beautysh",
						"black",
						"google-java-format",
						"stylua",

						-- Linters
						"commitlint",
						"ruff",
						"tflint",

						-- Debug adapters
						-- "bash-debug-adapter",
						-- "go-debug-adapter",
						-- "java-debug-adapter",
					},
					auto_update = false,
				},
			},
			{
				"williamboman/mason-lspconfig.nvim",
				config = function()
					local lspconfig = require("lspconfig")
					require("mason-lspconfig").setup_handlers({
						-- Default handler
						function(server_name)
							lspconfig[server_name].setup({
								on_attach = require("utils.lsp").on_attach,
                handlers = require("utils.lsp").handlers(),
								flags = {
									debounce_text_changes = 150,
								},
							})
						end,
						["lua_ls"] = function()
							lspconfig.lua_ls.setup({
								on_attach = require("utils.lsp").on_attach,
                handlers = require("utils.lsp").handlers(),
								flags = {
									debounce_text_changes = 150,
								},
								settings = {
									Lua = {
										diagnostics = {
											globals = { "vim" },
										},
										workspace = {
											checkThirdParty = false,
										},
										telemetry = {
											enable = false,
										},
									},
								},
							})
						end,
						["ruff_lsp"] = function()
							lspconfig.ruff_lsp.setup({
								on_attach = require("utils.lsp").on_attach,
                handlers = require("utils.lsp").handlers(),
								flags = {
									debounce_text_changes = 150,
								},
								init_options = {
									settings = {
										args = { "--config=$HOME/.config/nvim/configs/pyproject.toml" },
									},
								},
							})
						end,
						-- Disable jdtls LSP server
						["jdtls"] = function() end,
					})
				end,
			},
		},
		config = true,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		opts = function(_, opts)
			local formatting = require("null-ls").builtins.formatting
			local diagnostics = require("null-ls").builtins.diagnostics
			opts.sources = {
				formatting.black.with({
					extra_args = { "-l", "120" },
				}),
				formatting.ruff.with({
					extra_args = { "--config=$HOME/.config/nvim/configs/pyproject.toml" },
				}),
				formatting.stylua,
				formatting.google_java_format,
				formatting.beautysh,
				formatting.fixjson,
				diagnostics.zsh,
			}
		end,
	},
}
