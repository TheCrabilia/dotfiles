return {
	"navarasu/onedark.nvim",
	enabled = false,
	version = false,
	lazy = false,
	priority = 1000,
	opts = { style = "warmer" },
	config = function()
		vim.cmd.colorscheme("onedark")
	end,
}
