local M = {}

-- Functional wrapper for mapping custom keybindings
function M.keymap(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function M.find_vim_config()
    local opts = {}
    opts.search_dirs = {"~/.mtenv/nvim"}
    opts.prompt_title = "Search VIM config files"
    opts.shorten_path = true
    require("telescope.builtin").find_files(opts)
end

function M.find_zsh_config()
    local opts = {}
    opts.search_dirs = {"~/.mtenv/zsh"}
    opts.prompt_title = "Search ZSH config files"
    opts.shorten_path = true
    require("telescope.builtin").find_files(opts)
end

function M.find_in_work_dir()
    local opts = {}
    opts.search_dirs = {"~"}
    opts.prompt_title = "Search in Home directory"
    opts.shorten_path = true
    require("telescope.builtin").find_files(opts)
end

function M.find_utils()
    local opts = {}
    opts.search_dirs = {"~/.local/bin"}
    opts.prompt_title = "Search utilities"
    opts.shorten_path = true
    require("telescope.builtin").find_files(opts)
end

return M
