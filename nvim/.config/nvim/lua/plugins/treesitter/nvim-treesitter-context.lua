return {
	"nvim-treesitter/nvim-treesitter-context",
	opts = {
		enable = true,
		max_lines = 3,
		min_window_height = 32,
		line_numbers = true,
		multiline_threshold = 20,
		trim_scope = "outer",
		mode = "cursor", -- "cursor" or "topline"
		separator = nil,
		zindex = 20,
	},
	config = function(_, opts)
		require("treesitter-context").setup(opts)
		vim.api.nvim_set_hl(0, "TreesitterContextBottom", { sp = "Gray" })
		vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { sp = "Gray" })
	end,
}
