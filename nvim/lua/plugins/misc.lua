return {
	-- {
	-- 	"echasnovski/mini.pairs",
	-- 	version = false,
	-- 	event = { "BufReadPre", "BufNewFile" },
	-- 	main = "mini.pairs",
	-- 	dependencies = {
	-- 		{
	-- 			"echasnovski/mini.nvim",
	-- 			version = false,
	-- 		},
	-- 	},
	-- 	opts = {
	-- 		modes = { insert = true, command = false, terminal = false },
	-- 	},
	-- },
	-- surround
	-- {
	-- 	"echasnovski/mini.surround",
	-- 	version = false,
	-- 	event = { "BufReadPre", "BufNewFile" },
	-- 	main = "mini.surround",
	--    dependencies = {
	-- 		{
	-- 			"echasnovski/mini.nvim",
	-- 			version = false,
	-- 		},
	--    }
	-- },
	{
		"echasnovski/mini.comment",
		version = false,
		event = { "BufReadPre", "BufNewFile" },
		main = "mini.comment",
		dependencies = {
			{
				"echasnovski/mini.nvim",
				version = false,
			},
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		opts = {
			hooks = {
				pre = function()
					require("ts_context_commentstring.internal").update_commentstring({})
				end,
			},
		},
	},
	{
		"echasnovski/mini.ai",
		version = false,
		event = { "BufReadPre", "BufNewFile" },
		main = "mini.ai",
		dependencies = {
			{
				"echasnovski/mini.nvim",
				version = false,
			},
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
		},
		opts = function()
			local ai = require("mini.ai")
			return {
				n_lines = 500,
				custom_textobjects = {
					o = ai.gen_spec.treesitter({
						a = { "@block.outer", "@conditional.outer", "@loop.outer" },
						i = { "@block.inner", "@conditional.inner", "@loop.inner" },
					}, {}),
					f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
					c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
					C = ai.gen_spec.treesitter({ a = "@call.outer", i = "@call.inner" }, {}),
				},
			}
		end,
	},
	{
		"echasnovski/mini.cursorword",
		version = false,
		event = { "BufReadPre", "BufNewFile" },
		main = "mini.cursorword",
		dependencies = {
			{
				"echasnovski/mini.nvim",
				version = false,
			},
		},
		opts = {
			delay = 120,
		},
		config = function(_, opts)
			require("mini.cursorword").setup(opts)
			vim.api.nvim_create_autocmd("BufEnter", {
				pattern = "TelescopePrompt",
				callback = function()
					vim.b.minicursorword_disable = true
				end,
			})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			indent_blankline_char_blankline = "|",
			show_trailing_blankline_indent = true,
			indent_blankline_use_treesitter = true,
		},
		config = function(_, opts)
			require("indent_blankline").setup(opts)
		end,
	},
}
