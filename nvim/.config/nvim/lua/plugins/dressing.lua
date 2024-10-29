---@type LazySpec
return {
	"stevearc/dressing.nvim",
	event = "BufReadPost",
	opts = {
		input = {
			win_options = {
				winblend = 0,
			},
		},
	},
}
