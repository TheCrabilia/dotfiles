return {
	"lewis6991/gitsigns.nvim",
	event = "BufReadPost",
	opts = {},
	keys = {
		{
			"]c",
			mode = "n",
			function()
				if vim.wo.diff then
					return "]c"
				end
				vim.schedule(function()
					require("gitsigns").next_hunk()
				end)
				return "<Ignore>"
			end,
			desc = "Jump to the next hunk",
		},
		{
			"[c",
			mode = "n",
			function()
				if vim.wo.diff then
					return "[c"
				end
				vim.schedule(function()
					require("gitsigns").prev_hunk()
				end)
				return "<Ignore>"
			end,
			desc = "Jump to the previous hunk",
		},
		{
			"<leader>gs",
			mode = "n",
			function()
				require("gitsigns").preview_hunk_inline()
			end,
			desc = "Preview hunk",
		},
		{
			"<leader>gr",
			mode = "n",
			function()
				require("gitsigns").reset_hunk()
			end,
			desc = "Reset hunk",
		},
	},
}
