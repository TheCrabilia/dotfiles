---@type LazySpec
return {
	"mrjones2014/smart-splits.nvim",
	version = "v2.0.4",
	event = "VeryLazy",
	config = function()
		local smart_splits = require("smart-splits")
		smart_splits.setup()

		vim.keymap.set("n", "<M-h>", smart_splits.move_cursor_left)
		vim.keymap.set("n", "<M-j>", smart_splits.move_cursor_down)
		vim.keymap.set("n", "<M-k>", smart_splits.move_cursor_up)
		vim.keymap.set("n", "<M-l>", smart_splits.move_cursor_right)
	end,
}
