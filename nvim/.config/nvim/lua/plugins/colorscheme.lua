return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		enabled = false,
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
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		enabled = true,
		version = "v1.*",
		lazy = false,
		priority = 1000,
		opts = {
			variant = "moon",
		},
		config = function(_, opts)
			require("rose-pine").setup(opts)
			vim.cmd.colorscheme("rose-pine")
		end,
	},
}
