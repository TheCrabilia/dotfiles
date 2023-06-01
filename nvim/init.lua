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

-- Source vim options
require("opts")

require("lazy").setup({ import = "plugins" }, {
	defaults = {
		lazy = false,
		version = nil,
		cond = nil,
	},
	install = {
		missing = true,
		colorscheme = { "onedark", "habamax" },
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
})
