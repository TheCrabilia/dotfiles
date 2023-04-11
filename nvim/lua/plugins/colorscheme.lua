return {
	{
		"navarasu/onedark.nvim",
		version = false,
		lazy = false,
		priority = 1000,
		enabled = true,
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
}
