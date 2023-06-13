return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = function()
			local ext = require("utils.lualine").extensions
			return {
				options = {
					icons_enabled = true,
					theme = "auto",
					globalstatus = true,
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
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { "filename" },
					lualine_x = {
						"encoding",
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
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				-- winbar = {
				-- 	lualine_a = { "buffers" },
				-- },
				-- inactive_winbar = {
				-- 	lualine_a = { "buffers" },
				-- },
				extensions = {
					ext.fugitive,
					ext.nvim_dap_ui,
					ext.help,
					ext.telescope,
				},
			}
		end,
	},
}
