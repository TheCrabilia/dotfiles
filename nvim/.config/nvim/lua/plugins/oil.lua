return {
	"stevearc/oil.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		skip_confirm_for_simple_edits = true,
		lsp_rename_autosave = true,
		columns = {
			"permissions",
			"size",
		},
		view_options = {
			show_hidden = true,
		},
	},
	keys = {
		{
			"<leader>e",
			mode = "n",
			function()
				require("oil").open()
			end,
			desc = "Open file explorer",
		},
	},
}
