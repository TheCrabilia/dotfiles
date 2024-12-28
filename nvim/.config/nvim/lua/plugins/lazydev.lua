---@type LazySpec
return {
	"folke/lazydev.nvim",
	ft = "lua",
	dependencies = {
		"justinsgithub/wezterm-types",
	},
	opts = {
		library = {
			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			{ path = "wezterm-types", mods = { "wezterm" } },
		},
	},
}
