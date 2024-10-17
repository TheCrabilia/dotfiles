---@type LazySpec
return {
	"stevearc/dressing.nvim",
	event = "BufRead",
	opts = {
		input = {
			win_options = {
				winblend = 0,
			},
		},
	},
}
