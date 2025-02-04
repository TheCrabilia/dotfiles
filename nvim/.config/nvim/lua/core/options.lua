vim.g.omni_sql_no_default_maps = 1 -- Disable annoying default mappings for sql files

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Misc
vim.opt.autowrite = true
vim.opt.autoread = true
vim.opt.autowriteall = true
vim.opt.swapfile = false
vim.opt.undofile = true

vim.opt.encoding = "utf-8"
vim.opt.fileformat = "unix"
vim.opt.hidden = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = false

vim.opt.wildignore = { "__pycache__", "*.o", "*~", "*.pyc" }

-- Scrolling
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10

-- UI
vim.opt.updatetime = 250
vim.opt.laststatus = 3
vim.opt.cursorline = false
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "120"
vim.opt.guicursor = "a:block" -- Cursor styling
vim.opt.showmode = true
vim.opt.pumheight = 10
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.termguicolors = true -- Enable 24-bit RGB colors
vim.opt.shortmess:append("I") -- Disable intro message
vim.opt.cmdheight = 1
vim.opt.showmode = false
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.virtualedit = "block"
vim.opt.list = true
vim.opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }

-- Tabs
vim.opt.autoindent = true
vim.opt.cindent = false

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.backspace = "2"
vim.opt.joinspaces = false

vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.showbreak = string.rep(" ", 3)
vim.opt.linebreak = true
