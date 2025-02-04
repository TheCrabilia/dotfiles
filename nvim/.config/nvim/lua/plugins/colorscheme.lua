---@type LazySpec
return {
	{
		"catppuccin/nvim",
		enabled = false,
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "mocha",
			transparent_background = true,
			show_end_of_buffer = true,
			no_italic = true,
			integrations = {
				alpha = false,
				dashboard = false,
				flash = false,
				indent_blankline = {
					enabled = false,
				},
				mason = true,
				neotree = false,
				neogit = false,
				nvimtree = false,
				ufo = false,
				rainbow_delimiters = false,
				lsp_trouble = true,
				which_key = true,
			},
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"rose-pine/neovim",
		enabled = true,
		name = "rose-pine",
		priority = 1000,
		opts = {
			variant = "main",
			enable = {
				terminal = true,
				legacy_highlights = false,
				migrations = false,
			},
			styles = {
				bold = true,
				italic = false,
				transparency = true,
			},
			highlight_groups = {
				Normal = { fg = "text", bg = "#010101" },
			},
		},
		config = function(_, opts)
			require("rose-pine").setup(opts)
			vim.cmd.colorscheme("rose-pine")
		end,
	},
}
