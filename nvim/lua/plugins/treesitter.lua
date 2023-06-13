return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = function()
			vim.cmd.TSUpdate()
		end,
		main = "nvim-treesitter.configs",
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"dockerfile",
				"go",
				"gomod",
				"gosum",
				"hcl",
				"java",
				"json",
				"jsonc",
				"lua",
				"make",
				"python",
				"query",
				"rego",
				"terraform",
				"toml",
				"vim",
				"vimdoc",
				"yaml",
			},
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
				disable = function(_, buf)
					local max_filesize = 100 * 1024 -- 100 KiB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
				disable = { "yaml" },
			},
			context_commentstring = { enable = true },
			playground = { enable = true },
		},
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		event = { "InsertEnter" },
		dependencies = { "nvim-treesitter" },
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		event = { "InsertEnter" },
		dependencies = { "nvim-treesitter" },
	},
	{
		"nvim-treesitter/playground",
		cmd = "TSPlaygroundToggle",
		dependencies = { "nvim-treesitter" },
	},
	{
		"windwp/nvim-autopairs",
		event = { "InsertEnter" },
		dependencies = { "nvim-treesitter" },
		config = true,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = { "InsertEnter" },
		opts = {
			enable = true,
			max_lines = 3,
			min_window_height = 32,
			line_numbers = true,
			multiline_threshold = 20,
			trim_scope = "outer",
			mode = "cursor", -- "cursor" or "topline"
			separator = nil,
			zindex = 20,
		},
		config = function(_, opts)
			require("treesitter-context").setup(opts)
			vim.api.nvim_set_hl(0, "TreesitterContextBottom", { sp = "Gray" })
			vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { sp = "Gray" })
		end,
	},
}
