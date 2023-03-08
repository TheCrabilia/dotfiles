require("mason").setup()

require("mason-lspconfig").setup({})

require("mason-tool-installer").setup({
	ensure_installed = {
		-- Language servers
		"bash-language-server",
		"docker-compose-language-service",
		"dockerfile-language-server",
		"gopls",
		"html-lsp",
		"jdtls",
		"json-lsp",
		"lua-language-server",
		"marksman",
		"nginx-language-server",
		"pyright",
		"terraform-ls",
		"vim-language-server",
		"yaml-language-server",

		-- Formatters
		"beautysh",
		"black",
		"google-java-format",
		"isort",
		"stylua",

		-- Linters
		"commitlint",
		"tflint",

		-- Debug adapters
		-- "bash-debug-adapter",
		-- "go-debug-adapter",
		-- "java-debug-adapter",
	},
	auto_update = false,
})

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			-- Format only with null-ls enabled formatters
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

local telescope_builtin = require("telescope.builtin")
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
local lsp_attach = function(client, bufnr)
	-- require("illuminate").on_attach(client)
	require("which-key").register({
		K = { vim.lsp.buf.hover, "Help" },
		{
			l = {
				name = "LSP",
				r = { vim.lsp.buf.rename, "Rename" },
				f = {
					function()
						lsp_formatting(bufnr)
					end,
					"Format Document",
				},
				a = { vim.lsp.buf.code_action, "Code Action" },
				d = { telescope_builtin.lsp_definitions, "Definitions" },
				t = { telescope_builtin.lsp_type_definitions, "Type Definitions" },
				i = { telescope_builtin.lsp_implementations, "Implementations" },
				R = { telescope_builtin.lsp_references, "References" },
			},
			d = {
				name = "Diagnostics",
				n = { vim.diagnostic.goto_next, "Move to the next diagnostic" },
				p = { vim.diagnostic.goto_prev, "Move to the previous diagnostic" },
				l = { telescope_builtin.diagnostics, "List diagnostics" },
			},
			prefix = "<leader>",
		},
		buffer = bufnr,
		remap = false,
	})
end

local lspconfig = require("lspconfig")
require("mason-lspconfig").setup_handlers({
	-- Default handler
	function(server_name)
		lspconfig[server_name].setup({
			on_attach = lsp_attach,
			capabilities = lsp_capabilities,
			flags = {
				debounce_text_changes = 150,
			},
		})
	end,
	["lua_ls"] = function()
		lspconfig.lua_ls.setup({
			on_attach = lsp_attach,
			capabilities = lsp_capabilities,
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
	["jdtls"] = function() end,
})

-- Configure vim diagnostic
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	update_in_insert = false,
	underline = true,
	severity_sort = false,
	float = true,
})

local null_ls_ok, null_ls = pcall(require, "null-ls")
if not null_ls_ok then
	return
end
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	sources = {
		formatting.black,
		formatting.isort,
		formatting.stylua,
		formatting.google_java_format,
		formatting.beautysh,
		diagnostics.zsh,
	},
})
