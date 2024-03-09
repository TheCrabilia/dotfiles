---@type LazySpec
return {
	"lewis6991/gitsigns.nvim",
	event = "BufReadPre",
	opts = {
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "~" },
		},
	},
	keys = {
		{
			"<leader>gs",
			mode = "n",
			require("gitsigns").preview_hunk_inline,
			desc = "Preview hunk",
		},
		{
			"<leader>gr",
			mode = "n",
			require("gitsigns").reset_hunk,
			desc = "Reset hunk",
		},
	},
}
