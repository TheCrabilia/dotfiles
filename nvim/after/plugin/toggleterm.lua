local toggleterm = require("toggleterm")

toggleterm.setup {}

require("which-key").register({
  {
    ["<C-\\>"] = { function() toggleterm.toggle(1, 20, ".", "horizontal") end, "Toggle terminal" },
    mode = { "n", "t" },
  },
})
