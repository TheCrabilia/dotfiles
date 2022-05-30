local opt = vim.opt

opt.mouse = 'n'			                        -- Enable mouse support only for Normal mode
opt.encoding = 'utf-8'
opt.termguicolors = true
opt.scrolloff = 8
opt.ignorecase = true                           -- Ignore case in search
opt.incsearch = true
opt.hlsearch = false                            -- Hightlight found text while searching
opt.autowriteall = true                         -- Automatically save files
opt.autoread = true                             -- Automatically read file if it changed outside VIM
opt.hidden = true                               -- Make open buffers hidden
opt.number = true		                        -- Enable line numbers
opt.relativenumber = true	                    -- Make numbers relative
opt.cursorline = true		                    -- Highlight cursor line
opt.wrap = false                                -- Disable work wrap
opt.signcolumn = 'yes'
opt.colorcolumn = '80'
opt.swapfile = false		                    -- Disable swap file creation
opt.tabstop = 4		                            -- Configure Tab size
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.fileformat = 'unix'                         -- Set default file format
opt.undofile = true
opt.completeopt = 'menu,menuone,noselect'       -- Enable completion floating windows
opt.showmode = false                            -- Hide mode in status line

-- Colorshere configuration
opt.background = 'dark'
vim.cmd[[colorscheme gruvbox]]

vim.g.mapleader = ' '
vim.g.python3_host_prog = '/usr/local/bin/python3'
