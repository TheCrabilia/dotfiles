require("tabline").setup {
  enable = true,
}

vim.cmd [[
  set guioptions-=e " Use showtabline in gui vim
  set sessionoptions+=tabpages,globals " Store tabpages and globals in session
]]
