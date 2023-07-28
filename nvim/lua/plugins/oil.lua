return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	keys = {
		{
			"<leader>e",
			mode = "n",
			function()
				require("oil").open()
			end,
			desc = "Open File Explorer",
		},
	},
}
