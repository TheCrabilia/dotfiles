---@type LazySpec
return {
	"tpope/vim-fugitive",
	cmd = { "Git", "Gvdiffsplit" },
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
