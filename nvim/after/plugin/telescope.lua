local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup {
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    file_browser = {
      theme = "ivy",
      hijack_netrw = true,
    },
  },
}

local extensions = { "fzf", "file_browser", "project" }

for _, ext in pairs(extensions) do
  telescope.load_extension(ext)
end

-- Keymaps
require("which-key").register({
  e = { function()
    telescope.extensions.file_browser.file_browser { path = "%:p:h", respect_gitignore = false }
  end, "File Browser" },
  f = {
    name = "Find",
    f = { require("thecrabilia.telescope").find_files, "Find Files" },
    g = { builtin.git_files, "Git Files" },
    o = { builtin.oldfiles, "Old Files" },
    l = { builtin.live_grep, "Live Grep" },
    h = { builtin.help_tags, "Help Tags" },
    k = { builtin.keymaps, "Keymaps" },
    p = { function() telescope.extensions.project.project() end, "List Projects" },
    d = {
      name = "Dotfiles",
      n = { require("thecrabilia.telescope").edit_nvim, "Search nvim config files" },
      z = { require("thecrabilia.telescope").edit_zsh, "Search zsh config files" },
    },
  }
}, { prefix = "<leader>" })
