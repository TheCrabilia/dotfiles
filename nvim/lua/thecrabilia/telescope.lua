local M = {}

function M.edit_nvim()
  require("telescope.builtin").find_files {
    prompt_title = "~ dotfiles ~",
    shorten_path = false,
    cwd = "~/.config/nvim",
    follow = true,
  }
end

function M.edit_zsh()
  require("telescope.builtin").find_files {
    prompt_title = "~ dotfiles ~",
    shorten_path = false,
    cwd = "~/.config/zsh",
    hidden = true,
    follow = true,
  }
end

return M
