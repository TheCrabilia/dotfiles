return {
	"ellisonleao/gruvbox.nvim",
	version = false,
	lazy = false,
	priority = 1000,
	enabled = false,
	config = function()
		vim.cmd.colorscheme("gruvbox")
	end,
}
