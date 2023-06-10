return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		event = { "BufReadPost", "BufNewFile" },
		build = function()
			vim.cmd.TSUpdate()
		end,
		main = "nvim-treesitter.configs",
		dependencies = {
			{ "JoosepAlviste/nvim-ts-context-commentstring" },
			{ "windwp/nvim-autopairs", config = true },
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
			{ "nvim-treesitter/playground", enabled = true },
			{
				"nvim-treesitter/nvim-treesitter-context",
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
		},
		opts = {
			ensure_installed = {
				"bash",
				"go",
				"lua",
				"python",
				"json",
				"luadoc",
				"luap",
				"markdown",
				"markdown_inline",
				"regex",
				"vim",
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
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = "<nop>",
					node_decremental = "<bs>",
				},
			},
			context_commentstring = { enable = true },
			playground = { enable = true },
		},
	},
}
