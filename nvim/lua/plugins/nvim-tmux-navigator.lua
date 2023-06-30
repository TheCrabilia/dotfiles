return {
	"alexghergh/nvim-tmux-navigation",
	lazy = false,
	opts = {
		disable_when_zoomed = true,
	},
	keys = {
		{
			"<M-h>",
			mode = { "n", "t" },
			function()
				require("nvim-tmux-navigation").NvimTmuxNavigateLeft()
			end,
			desc = "Jump to left window",
		},
		{
			"<M-j>",
			mode = { "n", "t" },
			function()
				require("nvim-tmux-navigation").NvimTmuxNavigateDown()
			end,
			desc = "Jump to bottom window",
		},
		{
			"<M-k>",
			mode = { "n", "t" },
			function()
				require("nvim-tmux-navigation").NvimTmuxNavigateUp()
			end,
			desc = "Jump to top window",
		},
		{
			"<M-l>",
			mode = { "n", "t" },
			function()
				require("nvim-tmux-navigation").NvimTmuxNavigateRight()
			end,
			desc = "Jump to right window",
		},
	},
}
