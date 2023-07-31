local cursorline_group = vim.api.nvim_create_augroup("CursorLine", { clear = true })
local function set_cursorline(event, value, pattern)
	vim.api.nvim_create_autocmd(event, {
		group = cursorline_group,
		pattern = pattern,
		callback = function()
			vim.opt_local.cursorline = value
		end,
	})
end
set_cursorline("WinLeave", false)
set_cursorline("WinEnter", true)
set_cursorline("FileType", false, "TelescopePrompt")

-- Hightlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

-- Set formatoptions
-- Issue: https://neovim.discourse.group/t/options-formatoptions-not-working-when-put-in-init-lua/3746
vim.api.nvim_create_autocmd("BufEnter", {
	group = vim.api.nvim_create_augroup("FormatOptions", { clear = true }),
	pattern = "*",
	callback = function()
		vim.opt.formatoptions:remove("a") -- Disable auto formatting
		vim.opt.formatoptions:remove("t") -- Don't auto-wrap text
		vim.opt.formatoptions:append("c") -- Auto-wrap comments
		vim.opt.formatoptions:append("q") -- Allow formatting comments with gq
		vim.opt.formatoptions:remove("o") -- Don't insert comment leader when formatting
		vim.opt.formatoptions:append("r") -- Continue comments when pressing Enter
		vim.opt.formatoptions:append("n") -- Recognize numbered lists, when formatting
		vim.opt.formatoptions:append("j") -- Remove comment leader when joining lines
		vim.opt.formatoptions:remove("2") -- Don't use the indent of the second line
	end,
})
