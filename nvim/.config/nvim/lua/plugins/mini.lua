return {
	{
		"echasnovski/mini.nvim",
		version = false,
	},
	{
		"echasnovski/mini.ai",
		version = false,
		event = { "BufReadPost", "BufNewFile" },
		main = "mini.ai",
		dependencies = {
			"mini.nvim",
			"nvim-treesitter-textobjects",
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
}
