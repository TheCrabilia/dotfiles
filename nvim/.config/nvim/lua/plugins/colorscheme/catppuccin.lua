return {
	"catppuccin/nvim",
	enabled = true,
	version = false,
	lazy = false,
	priority = 1000,
	opts = {
		integrations = {
			alpha = false,
			cmp = true,
			dashboard = false,
			flash = false,
			harpoon = true,
			lsp_trouble = true,
			mason = true,
			mini = true,
			neogit = false,
			nvimtree = false,
			rainbow_delimeters = false,
			telekasten = true,
			treesitter_context = true,
			ts_rainbow = false,
			ts_rainbow2 = false,
			which_key = true,
		},
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin-macchiato")
	end,
}
