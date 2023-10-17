return {
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		priority = 999,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = function()
			local ext = require("utils.lualine").extensions
			return {
				options = {
					icons_enabled = true,
					theme = "auto",
					globalstatus = true,
					component_separators = { left = "|", right = "|" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = {
						statusline = {},
						winbar = {
							"Trouble",
							"toggleterm",
							"vim",
							"gitcommit",
						},
					},
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = {
						{ "branch" },
						{
							"diagnostics",
							symbols = { error = "E", warn = "W", info = "I", hint = "H" },
						},
					},
					lualine_c = {
						{ "filename", path = 4 },
					},
					lualine_x = {
						"encoding",
						{
							"fileformat",
							symbols = {
								unix = "LF",
								dos = "CRLF",
								mac = "CR",
							},
						},
						{ "filetype", icons_enabled = false },
					},
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_c = { "filename" },
					lualine_x = { "location" },
				},
				extensions = {
					ext.common,
					require("lualine.extensions.mason"),
					require("lualine.extensions.lazy"),
					require("lualine.extensions.nvim-dap-ui"),
					require("lualine.extensions.quickfix"),
				},
			}
		end,
	},
}
