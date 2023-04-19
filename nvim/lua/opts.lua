vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.loaded_netrw = 1 -- Disable netrw (builtin file explorer)
vim.g.loaded_netrwPlugin = 1

vim.opt.autowrite = true
vim.opt.autoread = true
vim.opt.autowriteall = true

-- vim.opt.cmdheight = 0 -- Hide command line
-- vim.opt.clipboard:append("unnamedplus") -- Copy to system clipboard
vim.opt.laststatus = 3
vim.opt.encoding = "utf-8"
vim.opt.fileformat = "unix"
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.hidden = true
vim.opt.shortmess:append("I") -- Disable intro message

vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.hlsearch = false

vim.opt.backspace = "2"
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "120"
vim.opt.pumheight = 20
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.termguicolors = true -- Enable 24-bit RGB colors
