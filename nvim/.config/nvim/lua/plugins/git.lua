---@type LazySpec
return {
	{
		"tpope/vim-fugitive",
		cmd = "Git",
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
			{
				"<leader>gl",
				mode = "n",
				function()
					vim.cmd.Git("log --graph --oneline")
				end,
				desc = "Git Log",
			},
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "~" },
			},
			signs_staged = {
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
	{
		dir = "/Users/taaspil1/Documents/plugins/git-worktree.nvim",
		enabled = false,
		name = "git-worktree",
		opts = {},
	},
}
