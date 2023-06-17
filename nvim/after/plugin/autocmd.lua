local cursorline_group = vim.api.nvim_create_augroup("cursorline", {})

vim.api.nvim_create_autocmd("WinLeave", {
	group = cursorline_group,
	callback = function()
		vim.wo.cursorline = false
	end,
})

vim.api.nvim_create_autocmd("WinEnter", {
	group = cursorline_group,
	callback = function()
		vim.wo.cursorline = true
	end,
})

-- Hightlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("yank_highlight", {}),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})
