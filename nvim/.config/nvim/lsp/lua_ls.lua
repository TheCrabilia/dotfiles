---@type vim.lsp.Config
return {
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
}
