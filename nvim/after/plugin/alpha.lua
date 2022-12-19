local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
  "                                                     ",
  "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
  "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
  "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
  "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
  "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
  "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
  "                                                     ",
}

-- Set menu
dashboard.section.buttons.val = {
  dashboard.button("e", "  > New file", "<cmd>enew <bar> startinsert <cr>"),
  dashboard.button("p", "  > Open project", "<cmd>lua print('not implemented yet')<cr>"),
  dashboard.button("r", "  > Recent", "<cmd>Telescope oldfiles<cr>"),
  dashboard.button("s", "  > Settings", "<cmd>cd $HOME/.config/nvim | Telescope find_files<cr>"),
  dashboard.button("q", "  > Quit", "<cmd>qa<cr>"),
}

require("alpha").setup(dashboard.opts)

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "alpha" },
  callback = function()
    vim.opt.foldenable = false
  end
})
