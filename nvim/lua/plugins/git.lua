return {
	{
		"tpope/vim-fugitive",
		version = false,
		cmd = "Git",
		dependencies = {
			{ "tpope/vim-rhubarb" },
		},
		init = function()
			local set = vim.keymap.set

			set("n", "<leader>gg", function()
				vim.cmd.Git()
			end, { desc = "Open Git" })
			set("n", "<leader>gp", function()
				vim.cmd.Git("push")
			end, { desc = "Git Push" })
			set("n", "<leader>gP", function()
				vim.cmd.Git("pull")
			end, { desc = "Git Pull" })
			set("n", "<leader>gf", function()
				vim.cmd.Git("fetch")
			end, { desc = "Git Fetch" })
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		version = false,
		event = { "BufReadPre", "BufNewFile" },
		config = true,
	},
}
