return {
	"sindrets/diffview.nvim",
	lazy = false,
	dependencies = { "nvim-web-devicons" },
	opts = {
		view = {
			default = {
				winbar_info = false,
			},
			merge_tool = {
				winbar_info = false,
			},
			file_history = {
				winbar_info = false,
			},
		},
		default_args = {
			DiffviewOpen = { "-uno" },
		},
		hooks = {
			diff_buff_read = function()
				vim.opt_local.colorcolumn = ""
			end,
		},
	},
}
