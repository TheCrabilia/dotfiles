local M = {}

function M.lsp_formatting(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
		timeout_ms = 2000,
	})
	vim.cmd.write()
end

function M.on_attach(_, bufnr)
	-- Configure diagnostics
	local signs = { Error = "E ", Warn = "W ", Hint = "H ", Info = "I " }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end
	vim.diagnostic.config({
		serverity_sort = true,
		signs = true,
		underline = true,
		update_in_insert = false,
		virtual_text = true,
	})

	-- Set keymaps
	local builtin = require("telescope.builtin")
	local set = vim.keymap.set

	set("n", "K", vim.lsp.buf.hover, { buffer = 0, remap = false, desc = "Help" })
	set("n", "<leader>lr", vim.lsp.buf.rename, { buffer = 0, remap = false, desc = "Rename" })
	set("n", "<leader>lf", function()
		M.lsp_formatting(bufnr)
	end, { buffer = 0, remap = false, desc = "Format Document" })
	set("n", "<leader>la", vim.lsp.buf.code_action, { buffer = 0, remap = false, desc = "Code Action" })
	set("n", "<leader>ld", builtin.lsp_definitions, { buffer = 0, remap = false, desc = "Definitions" })
	set("n", "<leader>lt", builtin.lsp_type_definitions, { buffer = 0, remap = false, desc = "Type Definitions" })
	set("n", "<leader>li", builtin.lsp_implementiotions, { buffer = 0, remap = false, desc = "Implementations" })
	set("n", "<leader>lR", builtin.lsp_references, { buffer = 0, remap = false, desc = "References" })
end

function M.handlers()
	local border = {
		{ "┌", "FloatBorder" },
		{ "─", "FloatBorder" },
		{ "┐", "FloatBorder" },
		{ "│", "FloatBorder" },
		{ "┘", "FloatBorder" },
		{ "─", "FloatBorder" },
		{ "└", "FloatBorder" },
		{ "│", "FloatBorder" },
	}
	return {
		["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
		["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
	}
end

return M
