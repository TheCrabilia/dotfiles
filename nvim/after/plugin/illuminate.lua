require("illuminate").configure({
  providers = {
    "lsp",
    "treesitter",
    "regex",
  },
  delay = 120,
  filetype_overrides = {},
  filetypes_denylist = {
    "dirvish",
    "fugitive",
    "gitcommit",
  },
  filetypes_allowlist = {},
  modes_denylist = {},
  modes_allowlist = {},
  providers_regex_syntax_denylist = {},
  providers_regex_syntax_allowlist = {},
  under_cursor = true,
  large_file_cutoff = nil,
  large_file_overrides = nil,
  min_count_to_highlight = 1,
})

-- vim.api.nvim_set_hl(0, "IlluminatedWordText", { underline = true })
-- vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { underline = true })
-- vim.api.nvim_set_hl(0, "IlluminatedWordRead", { underline = true })
