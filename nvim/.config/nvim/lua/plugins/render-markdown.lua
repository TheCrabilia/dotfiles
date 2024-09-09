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
		opts = {},
	},
	{
		"3rd/image.nvim",
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
