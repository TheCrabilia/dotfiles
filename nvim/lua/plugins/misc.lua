return {
	{
		"echasnovski/mini.ai",
		version = false,
		event = { "BufReadPre", "BufNewFile" },
		main = "mini.ai",
		dependencies = {
			{
				"echasnovski/mini.nvim",
				version = false,
			},
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
		},
		opts = function()
			local ai = require("mini.ai")
			return {
				n_lines = 500,
				custom_textobjects = {
					o = ai.gen_spec.treesitter({
						a = { "@block.outer", "@conditional.outer", "@loop.outer" },
						i = { "@block.inner", "@conditional.inner", "@loop.inner" },
					}, {}),
					f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
					c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
					C = ai.gen_spec.treesitter({ a = "@call.outer", i = "@call.inner" }, {}),
				},
			}
		end,
	},
	{
		"RRethy/vim-illuminate",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("illuminate").configure({
				filetypes_denylist = {
					"fugitive",
					"gitcommit",
					"help",
					"dapui_breakpoints",
					"dapui_scopes",
					"dapui_console",
					"dapui_watches",
					"dapui_stacks",
					"dap-repl",
					"tsplayground",
				},
			})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			char = "┆",
			use_treesitter = true,
			use_treesitter_scope = true,
			show_trailing_blankline_indent = true,
			show_first_indent_level = false,
			show_current_context = true,
			show_current_context_start = false,
			show_end_of_line = true,
			filetype_exclude = {
				"lspinfo",
				"lazy",
				"checkhelth",
				"help",
				"man",
				"fugitive",
				"gitcommit",
				"dapui_breakpoints",
				"dapui_scopes",
				"dapui_console",
				"dapui_watches",
				"dapui_stacks",
				"dap-repl",
				"tsplayground",
			},
		},
	},
	{
		"folke/neoconf.nvim",
		enabled = false,
		cmd = "Neoconf",
		opts = {},
	},
}
