return {
	"sindrets/diffview.nvim",
	cmd = "DiffviewOpen",
	dependencies = { "nvim-web-devicons" },
	opts = {
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
