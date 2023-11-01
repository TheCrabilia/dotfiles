return {
	"folke/zen-mode.nvim",
	cmd = { "ZenMode" },
	opts = {
		window = {
         width = 1,
			height = 1,
			options = {
				signcolumn = "no",
				number = false,
				relativenumber = false,
				cursorline = false,
				cursorcolumn = false,
				colorcolumn = "",
				foldcolumn = "0",
				list = false,
			},
		},
		plugins = {
			gitsigns = { enabled = true },
			tmux = { enabled = true },
			alacritty = {
				enabled = true,
				font = "18",
			},
			options = {
				enabled = true,
				showcmd = false,
				laststatus = 0,
			},
		},
	},
}
