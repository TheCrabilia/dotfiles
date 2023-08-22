return {
	{
		"tpope/vim-fugitive",
		cmd = { "Git", "Gvdiffsplit" },
		dependencies = { "tpope/vim-rhubarb" },
		keys = {
			{
				"<leader>gg",
				mode = "n",
				function()
					vim.cmd.Git()
				end,
				desc = "Open Git",
			},
			{
				"<leader>gp",
				mode = "n",
				function()
					vim.cmd.Git("push")
				end,
				desc = "Git Push",
			},
			{
				"<leader>gP",
				mode = "n",
				function()
					vim.cmd.Git("pull")
				end,
				desc = "Git Pull",
			},
			{
				"<leader>gf",
				mode = "n",
				function()
					vim.cmd.Git("fetch")
				end,
				desc = "Git Fetch",
			},
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
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
	},
}
