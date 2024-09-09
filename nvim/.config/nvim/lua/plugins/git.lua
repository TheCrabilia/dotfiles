---@type LazySpec
return {
	{
		"tpope/vim-fugitive",
		config = function()
			local map = vim.keymap.set

			map("n", "<leader>gg", vim.cmd.Git, { desc = "Open Git" })
			map("n", "<leader>gp", function()
				vim.cmd.Git("push")
			end, { desc = "Git Push" })
			map("n", "<leader>gP", function()
				vim.cmd.Git("pull")
			end, { desc = "Git Pull" })
			map("n", "<leader>gf", function()
				vim.cmd.Git("fetch")
			end, { desc = "Git Fetch" })
			map("n", "<leader>gl", function()
				vim.cmd.Git("log --graph --oneline")
			end, { desc = "Git Log" })
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "BufRead",
		config = function()
			local gitsigns = require("gitsigns")
			gitsigns.setup({
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
			})

			local map = vim.keymap.set
			map("n", "<leader>gs", gitsigns.preview_hunk_inline, { desc = "Preview hunk" })
			map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "Reset hunk" })
		end,
	},
	{
		dir = "/Users/taaspil1/Documents/plugins/git-worktree.nvim",
		name = "git-worktree",
		opts = {},
	},
}
