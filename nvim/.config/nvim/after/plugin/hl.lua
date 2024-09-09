-- Disable italic for all highlight groups
for name, opts in pairs(vim.api.nvim_get_hl(0, {})) do
	vim.api.nvim_set_hl(0, name, vim.tbl_extend("force", opts, { italic = false }))
end
