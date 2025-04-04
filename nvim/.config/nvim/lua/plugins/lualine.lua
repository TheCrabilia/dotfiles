--- @type LazySpec
return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		options = {
			icons_enabled = false,
			section_separators = "",
			component_separators = "|",
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = {
				{ "filename", path = 1 },
			},
			lualine_x = { "encoding", "fileformat", "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {
				{ "filename", path = 1 },
			},
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		extensions = {
			"fugitive",
			"lazy",
			"mason",
			"nvim-dap-ui",
			"oil",
			"quickfix",
		},
	},
}
