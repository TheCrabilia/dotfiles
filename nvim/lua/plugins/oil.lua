return {
	"stevearc/oil.nvim",
	enabled = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		columns = {
			"icon",
			"permissions",
			"size",
			"mtime",
		},
	},
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
