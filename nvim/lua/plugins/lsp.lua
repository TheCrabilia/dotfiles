return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Disable semantic token provider for all LSP servers
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-semantic-tokens", { clear = true }),
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if client.name ~= "null-ls" then
						client.server_capabilities.semanticTokensProvider = false
					end
				end,
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = true,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason.nvim" },
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
				"stylua",
				"fixjson",

				-- Linters
				"commitlint",
				"ruff",
				"tflint",
			},
			auto_update = false,
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"mason.nvim",
			"nvim-lspconfig",
		},
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
								runtime = { version = "LuaJIT" },
								diagnostics = {
									globals = { "vim" },
								},
								workspace = {
									library = vim.api.nvim_get_runtime_file("", true),
									maxPreload = 2000,
									preloadFileSize = 50000,
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
				["pyright"] = function()
					lspconfig.pyright.setup({
						on_attach = function(client, _)
							client.server_capabilities.codeActionProvider = false
						end,
						handlers = {
							["textDocument/publishDiagnostics"] = function() end,
						},
						settings = {
							pyright = {
								alalysis = {
									autoSearchPaths = true,
									typeCheckingMode = "basic",
									useLibraryCodeForTypes = true,
								},
							},
						},
					})
				end,
				-- Disable jdtls LSP server
				["jdtls"] = function() end,
			})
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = { "nvim-lspconfig" },
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
				formatting.beautysh,
				formatting.fixjson,
				diagnostics.zsh,
			}
		end,
	},
	{
		"folke/neodev.nvim",
		event = { "BufEnter *.lua" },
		dependencies = {
			"nvim-lspconfig",
		},
		opts = {
			experimental = {
				pathStrict = true,
			},
		},
	},
}
