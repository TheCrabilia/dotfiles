vim.api.nvim_set_hl(0, "StatusLineText", { fg = "#6e6a86" })

local default_statusline = function()
	return table.concat({
		"%#StatusLineText#",
		" %f",
		" %m",
		"%=",
		" %{&fileencoding?&fileencoding:&encoding}",
		" [%{&fileformat}]",
		"%y",
		" %p%%",
		" %l:%c",
	})
end

local qf_statusline = function()
	return table.concat({
		"%#StatusLineText#",
		"[Quickfix List]",
		"%=",
		" %{&fileencoding?&fileencoding:&encoding}",
		" [%{&fileformat}]",
		"%y",
		" %p%%",
		" %l:%c",
	})
end

local mason_statusline = function()
	return table.concat({
		"%#StatusLineText#",
		"[Mason]",
		"%=",
		" %{&fileencoding?&fileencoding:&encoding}",
		" [%{&fileformat}]",
		"%y",
		" %p%%",
		" %l:%c",
	})
end

local lazy_statusline = function()
	return table.concat({
		"%#StatusLineText#",
		"[Lazy]",
		"%=",
		" %{&fileencoding?&fileencoding:&encoding}",
		" [%{&fileformat}]",
		"%y",
		" %p%%",
		" %l:%c",
	})
end

local telescope_statusline = function()
	return table.concat({
		"%#StatusLineText#",
		"[Telescope]",
		"%=",
		" %{&fileencoding?&fileencoding:&encoding}",
		" [%{&fileformat}]",
		"%y",
		" %p%%",
		" %l:%c",
	})
end

local status_lines = {
	qf = qf_statusline,
	mason = mason_statusline,
	lazy = lazy_statusline,
	TelescopePrompt = telescope_statusline,
}

local augroup = vim.api.nvim_create_augroup("StatusLine", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	callback = function(ev)
		if status_lines[ev.file] ~= nil then
			vim.opt_local.statusline = status_lines[ev.file]()
		else
			vim.opt_local.statusline = default_statusline()
		end
	end,
})

vim.opt.statusline = default_statusline()
