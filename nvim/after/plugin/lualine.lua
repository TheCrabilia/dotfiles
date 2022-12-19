require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = "auto",
    globalstatus = true,
  },
  sections = {
    lualine_a = { "filename" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = {},
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
}
