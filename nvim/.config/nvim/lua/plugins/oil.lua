---@type LazySpec
return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		skip_confirm_for_simple_edits = true,
		lsp_file_methods = {
			timeout_ms = 1000,
			autosave_changes = true,
		},
		view_options = {
			show_hidden = true,
		},
	},
	keys = {
		{
			"-",
			mode = "n",
			function()
				require("oil").open()
			end,
			desc = "Open file explorer",
		},
	},
}
