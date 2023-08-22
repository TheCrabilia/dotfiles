return {
	"folke/todo-comments.nvim",
	lazy = false,
	cmd = { "TodoTrouble", "TodoTelescope" },
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		highlight = {
			keyword = "fg",
			pattern = [[.*<(KEYWORDS)(.*)\s*:]],
		},
		search = {
			command = "rg",
			args = {
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
			},
			pattern = [[\b(KEYWORDS)(.*):]],
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
