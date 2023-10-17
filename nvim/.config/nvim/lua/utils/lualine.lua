local M = {}

M.extensions = {}

M.extensions.common = {
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_x = { "filetype" },
		lualine_z = { "location" },
	},
	filetypes = {
		"fugitive",
		"TelescopePrompt",
	},
}

M.extensions.nvim_dap_ui = {
	winbar = {
		lualine_a = {
			function()
				local titles = {
					["dapui_breakpoints"] = "Breakpoints",
					["dapui_scopes"] = "Scopes",
					["dapui_console"] = "Console",
					["dapui_watches"] = "Watches",
					["dapui_stacks"] = "Stacks",
					["dap-repl"] = "Repl",
				}
				return titles[vim.bo.filetype]
			end,
		},
	},
	filetypes = {
		"dapui_breakpoints",
		"dapui_scopes",
		"dapui_console",
		"dapui_watches",
		"dapui_stacks",
		"dap-repl",
	},
}

return M
