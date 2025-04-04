return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = {
		".luarc.json",
		".luarc.jsonc",
		".luacheckrc",
		".stylua.toml",
		"stylua.toml",
		"selene.toml",
		"selene.yml",
		".git",
	},
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
