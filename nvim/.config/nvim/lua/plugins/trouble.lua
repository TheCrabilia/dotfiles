---@type LazySpec
return {
	"folke/trouble.nvim",
	version = "*",
	cmd = "Trouble",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	keys = {
		{
			"<leader>x",
			mode = "n",
			function()
				vim.cmd.Trouble("diagnostics toggle")
			end,
			desc = "Open Trouble diagnostics list",
		},
	},
}
