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
	local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
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

	-- Show diagnostics on cursor hold
	-- vim.api.nvim_create_autocmd("CursorHold", {
	-- 	buffer = bufnr,
	-- 	callback = function()
	-- 		local opts = {
	-- 			focusable = false,
	-- 			close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
	-- 			border = "rounded",
	-- 			source = "always",
	-- 			prefix = " ",
	-- 			scope = "cursor",
	-- 		}
	-- 		vim.diagnostic.open_float(nil, opts)
	-- 	end,
	-- })

	-- Set keymaps
	local builtin = require("telescope.builtin")
	local set = vim.keymap.set

	set("n", "K", function()
		vim.lsp.buf.hover()
	end, { buffer = 0, remap = false, desc = "Help" })
	set("n", "<leader>lr", function()
		vim.lsp.buf.rename()
	end, { buffer = 0, remap = false, desc = "Rename" })
	set("n", "<leader>lf", function()
		M.lsp_formatting(bufnr)
	end, { buffer = 0, remap = false, desc = "Format Document" })
	set("n", "<leader>la", function()
		vim.lsp.buf.code_action()
	end, { buffer = 0, remap = false, desc = "Code Action" })
	set("n", "<leader>ld", function()
		builtin.lsp_definitions()
	end, { buffer = 0, remap = false, desc = "Definitions" })
	set("n", "<leader>lt", function()
		builtin.lsp_type_definitions()
	end, { buffer = 0, remap = false, desc = "Type Definitions" })
	set("n", "<leader>li", function()
		builtin.lsp_implementiotions()
	end, { buffer = 0, remap = false, desc = "Implementations" })
	set("n", "<leader>lR", function()
		builtin.lsp_references()
	end, { buffer = 0, remap = false, desc = "References" })
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
