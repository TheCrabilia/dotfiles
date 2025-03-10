local map = vim.keymap.set

map("n", "J", "mzJ'z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("i", "<C-c>", "<ESC>")

map({ "v", "n" }, "<leader>y", '"+y')

map("n", "<leader><leader>X", function()
	vim.cmd.source(vim.fn.expand("%"))
end)

map("n", "<leader><leader>x", function()
	local line = vim.api.nvim_get_current_line()
	vim.cmd.lua(line)
end)

map("n", "j", function()
	local count = vim.v.count
	if count > 1 then
		vim.cmd("normal! m'" .. count .. "j")
	else
		vim.cmd("normal! j")
	end
end)

map("n", "k", function()
	local count = vim.v.count
	if count > 1 then
		vim.cmd("normal! m'" .. count .. "k")
	else
		vim.cmd("normal! k")
	end
end)

map("i", "<C-r>", "<C-r><C-o>")

map("n", "<C-w><", "<C-w>5<")
map("n", "<C-w>>", "<C-w>5>")
map("n", "<C-w>-", "<C-w>5-")
map("n", "<C-w>+", "<C-w>5+")
