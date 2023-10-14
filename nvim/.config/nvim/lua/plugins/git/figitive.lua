return {
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
}