---@type LazySpec
return {
	"folke/todo-comments.nvim",
	version = "*",
	event = "BufReadPost",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		highlight = {
			multiline = false,
			keyword = "bg",
			pattern = [[.*<(KEYWORDS)(.*)\s*:]],
		},
	},
	keys = {
		{
			"]t",
			mode = "n",
			function()
				require("todo-comments").jump_next()
			end,
			desc = "Next todo comment",
		},
		{
			"[t",
			mode = "n",
			function()
				require("todo-comments").jump_prev()
			end,
			desc = "Previous todo comment",
		},
		{
			"<leader>tt",
			mode = "n",
			function()
				vim.cmd.TodoTrouble()
			end,
			desc = "Open Trouble todo list",
		},
	},
}
