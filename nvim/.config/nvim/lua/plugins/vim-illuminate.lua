return {
	"RRethy/vim-illuminate",
	enabled = false,
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("illuminate").configure({
			filetypes_denylist = {
				"DressingInput",
				"TelescopePrompt",
				"dap-repl",
				"dapui_breakpoints",
				"dapui_console",
				"dapui_scopes",
				"dapui_stacks",
				"dapui_watches",
				"fugitive",
				"gitcommit",
				"help",
				"oil",
				"tsplayground",
			},
		})
	end,
}
