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
			indent = {
				enabled = true,
			},
			heading = {
				sign = false,
				icons = {},
			},
			code = {
				style = "normal",
				width = "block",
				min_width = 120,
			},
			link = {
				enabled = false,
			},
			overrides = {
				buftype = {
					nofile = {
						enabled = false,
					},
				},
			},
			win_options = {
				conceallevel = {
					rendered = 0,
				},
			},
		},
	},
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		cmd = { "ObsidianNew" },
		event = {
			"BufReadPre " .. vim.fn.expand("~") .. "~/vaults",
			"BufNewFile " .. vim.fn.expand("~") .. "~/vaults",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			workspaces = {
				{
					name = "work",
					path = "~/vaults/work",
				},
			},
			preferred_link_style = "markdown",
			ui = {
				enable = false,
			},
		},
		keys = {
			{
				"<leader>on",
				mode = "n",
				function()
					vim.cmd.ObsidianNew()
				end,
				desc = "Obsidian New Note",
			},
			{
				"<leader>of",
				mode = "n",
				function()
					vim.cmd.ObsidianQuickSwitch()
				end,
				desc = "Obsidian Quick Switch",
			},
		},
	},
	{
		"3rd/image.nvim",
		enabled = false,
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
