require("opts")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ import = "plugins" },
		{ import = "plugins.lsp" },
		{ import = "plugins.treesitter" },
		{ import = "plugins.git" },
		{ import = "plugins.debugging" },
	},
	defaults = { lazy = true },
	install = {
		missing = true,
		colorscheme = { "rose-pine" },
	},
	checker = {
		enabled = true,
		concurrency = nil,
		notify = false,
		frequency = 3600,
	},
	change_detection = {
		enabled = true,
		notify = false,
	},
	ui = { border = "rounded" },
	performance = {
		cache = {
			enabled = true,
		},
		rtp = {
			disabled_plugins = {
				"gzip",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})

require("statusline")
