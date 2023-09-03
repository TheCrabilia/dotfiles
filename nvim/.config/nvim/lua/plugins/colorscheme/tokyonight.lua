return {
	"folke/tokyonight.nvim",
	enabled = false,
	version = false,
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("tokyonight-storm")
	end,
}
