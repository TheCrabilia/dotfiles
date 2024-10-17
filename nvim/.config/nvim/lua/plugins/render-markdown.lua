---@type LazySpec
return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = "markdown",
		dependencies = {
			"3rd/image.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			anti_conceal = { enabled = false },
			heading = {
				sign = false,
				icons = {},
			},
			code = {
				sign = false,
				border = "thick",
				width = "block",
				min_width = 120,
			},
			overrides = {
				buftype = {
					nofile = {
						heading = { enabled = false },
						code = { enabled = false },
						dash = { enabled = false },
						bullet = { enabled = false },
						checkbox = { enabled = false },
						quote = { enabled = false },
						pipe_table = { enabled = false },
						link = { enabled = false },
						sign = { enabled = false },
						indent = { enabled = false },
					},
				},
			},
		},
	},
	{
		"3rd/image.nvim",
		lazy = true,
		dependencies = {
			"leafo/magick",
		},
		opts = {
			integrations = {
				markdown = {
					only_render_image_at_cursor = true,
				},
			},
		},
	},
}
