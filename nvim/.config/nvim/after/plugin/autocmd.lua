local augroup = vim.api.nvim_create_augroup("TheCrabilia", { clear = true })
local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
	group = augroup,
	pattern = { "fugitive", "gitcommit", "help", "qf", "oil" },
	callback = function()
		vim.opt_local.colorcolumn = ""
	end,
})

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
set_tabstop(2, { "query", "rego", "terraform", "terraform-vars", "hcl", "yaml", "helm", "fish", "norg" }, true)
set_tabstop(2, "lua", false)
set_tabstop(4, { "c", "cpp", "go", "templ" }, false)

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
		vim.opt.formatoptions:append("t") -- Auto-wrap text based on textwidth
		vim.opt.formatoptions:append("c") -- Auto-wrap comments
		vim.opt.formatoptions:append("q") -- Allow formatting comments with gq
		vim.opt.formatoptions:remove("o") -- Don't insert comment leader when formatting
		vim.opt.formatoptions:append("r") -- Continue comments when pressing Enter
		vim.opt.formatoptions:append("n") -- Recognize numbered lists, when formatting
		vim.opt.formatoptions:append("j") -- Remove comment leader when joining lines
		vim.opt.formatoptions:remove("2") -- Don't use the indent of the second line
	end,
})

autocmd("ColorScheme", {
	group = augroup,
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
	end,
})

vim.api.nvim_create_user_command("Notes", function()
	vim.cmd.tabnew()
	vim.cmd.edit("~/notes.md")
end, {})
