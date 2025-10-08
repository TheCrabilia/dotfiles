---@type vim.lsp.Config
return {
	settings = {
		basedpyright = {
			analysis = {
				autoSearchPaths = true,
				diagnosticsMode = "workspace",
				useLibraryCodeForTypes = true,
				autoImportCompletions = true,
			},
		},
	},
}
