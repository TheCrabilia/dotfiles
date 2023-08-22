local M = {}

M.extensions = {}

M.extensions.fugitive = {
	winbar = {
		lualine_a = {
			function()
				return "Fugitive"
			end,
		},
	},
	filetypes = { "fugitive" },
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

M.extensions.help = {
	winbar = {
		lualine_a = {
			function()
				return "Help"
			end,
		},
	},
	filetypes = { "help" },
}

M.extensions.telescope = {
	sections = {
		lualine_a = {
			"mode",
		},
		lualine_b = {
			"branch",
		},
		lualine_c = {},
		lualine_x = {
			{
				"fileformat",
				icons_enabled = true,
				symbols = {
					unix = "LF",
					dos = "CRLF",
					mac = "CR",
				},
			},
			"filetype",
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	filetypes = { "TelescopePrompt" },
}

return M
