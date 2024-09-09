---@type LazySpec
return {
	"AlexvZyl/nordic.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		italic_comments = false,
		bright_border = true,
		override = {
			DiagnosticVirtualTextOk = { link = "DiagnosticOk" },
			DiagnosticVirtualTextHint = { link = "DiagnosticHint" },
			DiagnosticVirtualTextInfo = { link = "DiagnosticInfo" },
			DiagnosticVirtualTextWarn = { link = "DiagnosticWarn" },
			DiagnosticVirtualTextError = { link = "DiagnosticError" },
			DiagnosticVirtualTextWarning = { link = "DiagnosticWarning" },
			Pmenu = { link = "NormalFloat" },
		},
		telescope = {
			style = "classic",
		},
	},
	config = function(_, opts)
		require("nordic").setup(opts)
		vim.cmd.colorscheme("nordic")
	end,
}
