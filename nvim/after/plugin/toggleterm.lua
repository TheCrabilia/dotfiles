local toggleterm = require("toggleterm")

toggleterm.setup {}

require("which-key").register({
  {
    ["<C-\\>"] = { function() toggleterm.toggle(1, 20, ".", "horizontal") end, "Toggle terminal" },
    mode = { "n", "t" },
  },
  {
    ["<M-h>"] = { function() vim.cmd.wincmd("h") end, "Move onw window right" },
    ["<M-j>"] = { function() vim.cmd.wincmd("j") end, "Move one window down" },
    ["<M-k>"] = { function() vim.cmd.wincmd("k") end, "Move one window up" },
    ["<M-l>"] = { function() vim.cmd.wincmd("l") end, "Move one window left" },
    mode = "t",
  },
})
