require("which-key").register({
  r = { function()
    vim.cmd.write()
    require("toggleterm").exec("python3 " .. vim.fn.expand("%"), 1, vim.o.columns * 0.4, ".", "vertical", true, true)
  end, "Run current Python file" },
}, { prefix = "<leader>", buffer = 0 })
