local M = {}

function M.lsp_format(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			local allowed_clients = { "null-ls", "ruff_lsp", "taplo", "jsonls" }
			return vim.tbl_contains(allowed_clients, client.name)
		end,
		bufnr = bufnr,
		timeout_ms = 2000,
		async = true,
	})
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
