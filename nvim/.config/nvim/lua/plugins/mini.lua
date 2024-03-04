return {
	"echasnovski/mini.nvim",
	config = function()
		local statusline = require("mini.statusline")
		statusline.setup({
			use_icons = true,
			set_vim_settings = false,
		})
	end,
}
