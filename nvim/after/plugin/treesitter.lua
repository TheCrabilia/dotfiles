require("nvim-treesitter.configs").setup {
  ensure_installed = { "python", "go", "lua", "help" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
    disable = {},
  },

  -- Treesitter plugins
  rainbow = {
    enable = true,
    extended_mode = true,
  },
  autopairs = {
    enable = true,
  },
  playground = {
    enable = true,
  }
}
