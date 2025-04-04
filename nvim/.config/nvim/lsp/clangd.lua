---@type vim.lsp.Config
return {
	cmd = { "clangd" },
	filetypes = { "c", "cpp", "objc", "objcpp" },
	root_markers = {
		".clangd",
		".clang-tidy",
		".clang-format",
		"compile_commands.json",
		"compile_flags.txt",
		"configure.ac",
	},
	capabilities = {
		textDocument = {
			completion = {
				editsNearCursor = true,
			},
		},
		offsetEncoding = { "utf-8" },
		debounce_text_changes = 200,
	},
	init_options = {
		fallbackFlags = {
			"-I",
			"/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/c++/v1",
		},
	},
}
