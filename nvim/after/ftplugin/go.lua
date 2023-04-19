require("which-key").register({
  r = { function()
    vim.cmd.write()
    require("toggleterm").exec("go run " .. vim.fn.expand("%"), 1, vim.o.columns * 0.4, ".", "vertical", true, true)
  end, "Run current Go file" },
}, { prefix = "<leader>", buffer = 0 })
