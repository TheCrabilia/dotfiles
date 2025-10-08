---@type vim.lsp.Config
return {
	capabilities = {
		offsetEncoding = { "utf-8" },
	},
	init_options = {
		fallbackFlags = {
			"-I",
			"/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/c++/v1",
		},
	},
}
