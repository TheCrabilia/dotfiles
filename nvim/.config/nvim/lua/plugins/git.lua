---@type LazySpec
return {
	"tpope/vim-fugitive",
	dependencies = {
		"lewis6991/gitsigns.nvim",
	},
	config = function()
		local gitsigns = require("gitsigns")
		local map = vim.keymap.set

		gitsigns.setup({
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "~" },
			},
		})

		map("n", "<leader>gs", gitsigns.preview_hunk_inline, { desc = "Preview hunk" })
		map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "Reset hunk" })

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
			vim.cmd.Git("log")
		end, { desc = "Git Log" })
	end,
}
