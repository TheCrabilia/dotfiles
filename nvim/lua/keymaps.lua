nest = require("nest")

nest.applyKeymaps {
    -- Keymaps for Normal mode
    { "g", {
        { "n", "<cmd>bn<cr>" }, -- Open next buffer
        { "p", "<cmd>bp<cr>" }, -- Open prev buffer
    }},

    { "<C-n>", "<cmd>NERDTree<cr>" }, -- NERDTree open
    { "<C-t>", "<cmd>NERDTreeToggle<cr>" }, -- NERDTree toggle
    { "<C-f>", "<cmd>NERDTreeFind<cr>" }, -- NERDTree find

    { "<leader>", {
        { "w", "<cmd>BufferClose<cr>" }, -- Close current buffer
        { "n", "<cmd>NERDTreeFocus<cr>" }, -- NERDTree focus
        { "f", {
            { "f", "<cmd>lua require('telescope.builtin').find_files()<cr>" }, -- Telescope find files
            { "g", "<cmd>lua require('telescope.builtin').live_grep()<cr>" }, -- Telescope live grep
            { "b", "<cmd>lua require('telescope.builtin').buffers()<cr>" }, -- Telescope search in opened buffers
            { "h", "<cmd>lua require('telescope.builtin').help_tags()<cr>" }, -- Telescope search help
            { "g", {
                { "b", "<cmd>lua require('telescope.builtin').git_branches()<cr>" }, -- Telescope search in Git branches
                { "c", "<cmd>lua require('telescope.builtin').git_commits()<cr>" }, -- Telescope search in Git commits
                { "s", "<cmd>lua require('telescope.builtin').git_status()<cr>" }, -- Telescope list Git status
            }},
            { "c", {
                { "v", "<cmd>lua require('functions').find_vim_config()<cr>" }, -- Custom find in vim config directory
                { "z", "<cmd>lua require('functions').find_zsh_config()<cr>" }, -- Custom find in zsh config directory
            }},
        }},
        { "g", {
            { "s", "<cmd>Git status<cr>" },
        }},
    }},

    { "<F7>", "<cmd>FloatermNew<cr>" }, -- Floaterm open new window
    { "<F8>", "<cmd>FloatermPrev<cr>" }, -- Floaterm open prev terminal
    { "<F9>", "<cmd>FloatermNext<cr>" }, -- Floaterm open next terminal
    { "<F12>", "<cmd>FloatermToggle<cr>" }, -- Floaterm toggle terminal

    -- Keymaps for Insert mode
    { mode = "i", {
        { "jk", "<esc>" }, -- Exit from insert mode
    }},

    -- Keymaps for Terminal mode
    { mode = "t", {
        { "<F7>", "<cmd>FloatermNew<cr>" }, -- Floaterm open new window
        { "<F8>", "<cmd>FloatermPrev<cr>" }, -- Floaterm open prev terminal
        { "<F9>", "<cmd>FloatermNext<cr>" }, -- Floaterm open next terminal
        { "<F12>", "<cmd>FloatermToggle<cr>" }, -- Floaterm toggle terminal
    }},
}

