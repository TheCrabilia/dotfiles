return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	main = "ibl",
	version = "3.*",
	opts = {
		indent = {
			char = "┆",
		},
		scope = {
			enabled = true,
			context_char = "│",
			show_start = false,
			show_end = false,
		},
		exclude = {
			filetypes = {
				"checkhelth",
				"dap-repl",
				"dapui_breakpoints",
				"dapui_console",
				"dapui_scopes",
				"dapui_stacks",
				"dapui_watches",
				"fugitive",
				"gitcommit",
				"help",
				"lazy",
				"lspinfo",
				"man",
				"mason",
				"tsplayground",
				"DressingInput",
			},
		},
	},
	config = function(_, opts)
		require("ibl").setup(opts)

		local hooks = require("ibl.hooks")
		hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_tab_indent_level)
		hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
	end,
}
