return {
	"rose-pine/neovim",
	name = "rose-pine",
	version = "v1.*",
	lazy = false,
	priority = 1000,
	opts = {
		disable_background = true,
		disable_float_background = true,
		disable_italics = true,
		highlight_groups = {
			ColorColumn = { bg = "text", blend = 10 },
			CursorLine = { bg = "text", blend = 7 },
			TelescopeSelection = { bg = "text", blend = 10 },
			PmenuSel = { bg = "text", blend = 10 },
			StatusLineNC = { bg = "text", fg = "NONE", blend = 10 },
			-- Disable background for GitSigns
			GitSignsAdd = { fg = "#9ccfd8", bg = "none" },
			GitSignsChange = { fg = "#ebbcba", bg = "none" },
			GitSignsDelete = { fg = "#eb6f92", bg = "none" },
		},
	},
	config = function(_, opts)
		require("rose-pine").setup(opts)
		vim.cmd.colorscheme("rose-pine")
	end,
}
