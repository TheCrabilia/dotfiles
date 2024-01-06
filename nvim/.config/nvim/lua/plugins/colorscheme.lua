return {
	"rose-pine/neovim",
	name = "rose-pine",
	enabled = true,
	version = "v1.*",
	lazy = false,
	priority = 1000,
	opts = {
		disable_background = true,
		disable_float_background = true,
		disable_italics = true,
		highlight_groups = {
			ColorColumn = { bg = "text", blend = 10 },
			CursorLine = { bg = "text", blend = 10 },
		},
	},
	config = function(_, opts)
		require("rose-pine").setup(opts)
		vim.cmd.colorscheme("rose-pine")
	end,
}
