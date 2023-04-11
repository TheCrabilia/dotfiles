return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		event = { "BufReadPost", "BufNewFile" },
		build = ":TSUpdate",
		main = "nvim-treesitter.configs",
		dependencies = {
			{ "p00f/nvim-ts-rainbow" },
			{ "windwp/nvim-autopairs", enabled = false },
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
			{ "nvim-treesitter/playground", enabled = false },
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
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
				disable = { "yaml", "python" },
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
			context_commentstring = { enable = true, enable_autocmd = false },
			autopairs = { enable = false },
			playground = { enable = false },
		},
	},
}
