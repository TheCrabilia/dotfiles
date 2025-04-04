vim.opt_local.textwidth = 120
vim.opt_local.colorcolumn = ""
vim.opt_local.cursorline = false

local win_config = vim.api.nvim_win_get_config(0)
if win_config.relative == "" then
	vim.opt_local.spell = true
end
