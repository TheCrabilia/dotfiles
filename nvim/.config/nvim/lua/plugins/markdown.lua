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
				enabled = true,
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
					rendered = 3,
				},
			},
		},
	},
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		cmd = { "ObsidianNew" },
		event = {
			"BufReadPre " .. vim.fn.expand("~") .. "/notes",
			"BufNewFile " .. vim.fn.expand("~") .. "/notes",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			workspaces = {
				{
					name = "work",
					path = "~/notes/work",
				},
				{
					name = "personal",
					path = "~/notes/personal",
				},
			},
			follow_url_func = function(url)
				vim.ui.open(url)
			end,
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
				desc = "Obsidian Create New Note",
			},
			{
				"<leader>of",
				mode = "n",
				function()
					vim.cmd.ObsidianQuickSwitch()
				end,
				desc = "Obsidian Quick Switch",
			},
			{
				"<leader>ow",
				mode = "n",
				function()
					vim.cmd.ObsidianWorkspace()
				end,
				desc = "Obsidian Switch Workspace",
			},
		},
	},
	{
		"3rd/image.nvim",
		-- enabled = false,
		lazy = true,
		dependencies = {
			"leafo/magick",
		},
		opts = {
			-- backend = "ueberzug",
			integrations = {
				markdown = {
					only_render_image_at_cursor = true,
				},
			},
		},
	},
}
