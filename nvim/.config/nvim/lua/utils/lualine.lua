local M = {}

local function fugitive_branch()
	return " " .. vim.fn.FugitiveHead()
end

M.extensions = {}

M.extensions.fugitive = {
	sections = {
		lualine_a = { "mode" },
		lualine_b = { fugitive_branch },
		lualine_x = { "filetype" },
		lualine_z = { "location" },
	},
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
		lualine_a = { "mode" },
		lualine_b = { fugitive_branch },
		lualine_x = { "filetype" },
		lualine_z = { "location" },
	},
	filetypes = { "TelescopePrompt" },
}

M.extensions.lazy = {
	sections = {
		lualine_a = { "mode" },
		lualine_b = { fugitive_branch },
		lualine_x = { "filetype" },
		lualine_z = { "location" },
	},
	filetypes = { "lazy" },
}

return M
