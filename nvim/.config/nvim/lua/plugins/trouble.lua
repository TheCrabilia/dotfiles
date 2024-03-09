---@type LazySpec
return {
	"folke/trouble.nvim",
	cmd = "Trouble",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	keys = {
		{
			"<leader>td",
			mode = "n",
			function()
				vim.cmd.Trouble("workspace_diagnostics")
			end,
			desc = "Open Trouble diagnostics list",
		},
	},
}
