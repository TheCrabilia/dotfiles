---@type LazySpec
return {
	"stevearc/oil.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		columns = {
			"icon",
			"permissions",
			"size",
		},
		delete_to_trash = true,
		skip_confirm_for_simple_edits = true,
		lsp_file_methods = {
			timeout_ms = 1000,
			autosave_changes = true,
		},
		constrain_cursor = "name",
		view_options = {
			show_hidden = true,
			is_always_hidden = function(name)
				local hidden = { ".DS_Store", ".." }
				return vim.tbl_contains(hidden, name)
			end,
		},
		float = {
			max_width = 120,
			max_height = 30,
		},
	},
	keys = {
		{
			"-",
			mode = "n",
			function()
				require("oil").open()
			end,
			desc = "Open file explorer in floating window",
		},
		{
			"_",
			mode = "n",
			function()
				require("oil").open_float()
			end,
			desc = "Open file explorer",
		},
	},
}
