---@type LazySpec
return {
	"AlexvZyl/nordic.nvim",
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
			-- highlights.Pmenu = { link = "NormalFloat" }

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
}
