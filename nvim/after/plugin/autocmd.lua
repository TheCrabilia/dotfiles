vim.api.nvim_create_autocmd("WinLeave", {
	callback = function()
		vim.wo.cursorline = false
	end,
})

vim.api.nvim_create_autocmd("WinEnter", {
	callback = function()
		vim.wo.cursorline = true
	end,
})
