---@type LazySpec
return {
	{
		"AlexvZyl/nordic.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		opts = {
			italic_comments = false,
			bright_border = true,
			on_highlight = function(highlights)
				highlights.DiagnosticVirtualTextOk = { link = "DiagnosticOk" }
				highlights.DiagnosticVirtualTextHint = { link = "DiagnosticHint" }
				highlights.DiagnosticVirtualTextInfo = { link = "DiagnosticInfo" }
				highlights.DiagnosticVirtualTextWarn = { link = "DiagnosticWarn" }
				highlights.DiagnosticVirtualTextError = { link = "DiagnosticError" }
				highlights.DiagnosticVirtualTextWarning = { link = "DiagnosticWarning" }

				-- disable all italics
				for _, hi in pairs(highlights) do
					hi.italic = false
				end
			end,
			telescope = {
				style = "classic",
			},
		},
		config = function(_, opts)
			require("nordic").setup(opts)
			vim.cmd.colorscheme("nordic")
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "mocha",
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
}
