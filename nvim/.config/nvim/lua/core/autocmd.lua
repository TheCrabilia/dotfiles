local augroup = vim.api.nvim_create_augroup("TheCrabilia", { clear = true })
local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
	group = augroup,
	pattern = { "fugitive", "gitcommit", "help", "qf" },
	callback = function()
		vim.opt_local.colorcolumn = ""
	end,
})

--- Set tabstop option for specific filetypes
---@param value number
---@param pattern string | table
---@param expandtab boolean
local function set_tabstop(value, pattern, expandtab)
	autocmd("FileType", {
		group = augroup,
		pattern = pattern,
		callback = function()
			vim.opt_local.tabstop = value
			vim.opt_local.shiftwidth = value
			vim.opt_local.softtabstop = value
			vim.opt_local.expandtab = expandtab
		end,
	})
end
set_tabstop(2, { "query", "rego", "terraform", "terraform-vars", "hcl", "yaml", "helm" }, true)
set_tabstop(3, "lua", false)
set_tabstop(4, { "c", "cpp", "go" }, false)

---Set/unset cursorline
---@param event string | table
---@param value boolean
---@param pattern string | table | nil
local function set_cursorline(event, value, pattern)
	autocmd(event, {
		group = augroup,
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
autocmd("TextYankPost", {
	group = augroup,
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
autocmd("BufEnter", {
	group = augroup,
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
