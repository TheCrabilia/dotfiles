local M = {}

--- Get LSP server name by diagnostics namespace
---@param ns number
---@return string
function M.get_server_name_by_diagnostics_ns(ns)
	local redefine = {
		ruff_lsp = "ruff",
	}

	local namespaces = vim.diagnostic.get_namespaces()
	local name = vim.split(namespaces[ns].name, ".", { plain = true })[3]
	return redefine[name] or name
end

--- Configure LSP diagnostics
function M.setup_diagnostics()
	vim.diagnostic.config({
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
end

return M
