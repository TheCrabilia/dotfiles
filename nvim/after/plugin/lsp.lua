local f = require("thecrabilia.functions")
local lsp = require("lsp-zero")

lsp.preset("recommended")

-- lsp-zero config
lsp.set_preferences({
	set_lsp_keymaps = false,
})

-- Global on_attach functions
local wk = require("which-key")
local builtin = require("telescope.builtin")

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			-- Format only with null-ls enabled formatters
			-- return client.name == "null-ls"
			return true
		end,
		bufnr = bufnr,
	})
end

lsp.on_attach(function(client, bufnr)
	-- Enable format on save
	local format_exclude = {}
	if not f.has_value(format_exclude, client.name) then
		require("lsp-format").on_attach(client)
	end

	-- Illuminate
	require("illuminate").on_attach(client)

	-- Keymaps
	wk.register({
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
				d = { builtin.lsp_definitions, "Definitions" },
				t = { builtin.lsp_type_definitions, "Type Definitions" },
				i = { builtin.lsp_implementations, "Implementations" },
				R = { builtin.lsp_references, "References" },
			},
			d = {
				name = "Diagnostics",
				n = { vim.diagnostic.goto_next, "Move to the next diagnostic" },
				p = { vim.diagnostic.goto_prev, "Move to the previous diagnostic" },
				l = { builtin.diagnostics, "List diagnostics" },
			},
			prefix = "<leader>",
		},
		buffer = bufnr,
		remap = false,
	})
end)

-- Default configuration for all LSP servers
lsp.set_server_config({
	flags = {
		debounce_text_changes = 150,
	},
})

-- Configure individual language server
lsp.configure("sumneko_lua", {
	settings = {
		Lua = {
			workspace = {
				checkThirdParty = false,
			},
			telemetry = {
				enable = false,
			},
		},
	},
})

lsp.skip_server_setup({ "jdtls" })

local cmp = require("cmp")
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-d>"] = cmp.mapping.scroll_docs(-4),
	["<C-f>"] = cmp.mapping.scroll_docs(4),
	["<C-Space>"] = cmp.mapping.complete(),
	["<Tab>"] = cmp.mapping.confirm({
		behavior = cmp.ConfirmBehavior.Replace,
		select = true,
	}),
})
cmp_mappings["<CR>"] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
	sources = {
		{ name = "buffer", group_index = 3, keyword_length = 3 },
		{ name = "luasnip", group_index = 1, keyword_length = 2 },
		{ name = "nvim_lsp", group_index = 1, keyword_length = 1 },
		{ name = "nvim_lua", group_index = 2, keyword_length = 1 },
		{ name = "path", group_index = 2, keyword_length = 2 },
	},
})

lsp.setup()

-- Configure vim diagnostic
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	update_in_insert = false,
	underline = true,
	severity_sort = false,
	float = true,
})

local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	sources = {
		formatting.black,
		formatting.isort,
		formatting.google_java_format,
	},
})
