return {
	"lewis6991/gitsigns.nvim",
	event = "BufReadPre",
	opts = {
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "~" },
		},
	},
	config = function(_, opts)
		-- Remove background color from signs
		vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#9ccfd8", bg = "none" })
		vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#ebbcba", bg = "none" })
		vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#eb6f92", bg = "none" })

		require("gitsigns").setup(opts)
	end,
}
