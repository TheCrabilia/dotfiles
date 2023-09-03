return {
	{
		"navarasu/onedark.nvim",
		version = false,
		lazy = false,
		priority = 1000,
		enabled = false,
		opts = { style = "warmer" },
		config = function()
			vim.cmd.colorscheme("onedark")
		end,
	},
	{
		"folke/tokyonight.nvim",
		version = false,
		lazy = false,
		priority = 1000,
		enabled = false,
		config = function()
			vim.cmd.colorscheme("tokyonight-storm")
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		version = false,
		lazy = false,
		priority = 1000,
		enabled = false,
		config = function()
			vim.cmd.colorscheme("gruvbox")
		end,
	},
	{
		"catppuccin/nvim",
		version = false,
		lazy = false,
		priority = 1000,
		enabled = true,
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
}
