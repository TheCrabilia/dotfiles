return {
	"echasnovski/mini.nvim",
	config = function()
		local ai = require("mini.ai")
		local spec_treesitter = ai.gen_spec.treesitter
		require("mini.ai").setup({
			n_lines = 500,
			custom_textobjects = {
				f = spec_treesitter({ a = "@function.outer", i = "@function.inner" }),
				c = spec_treesitter({
					a = { "@conditional.outer", "@loop.outer" },
					i = { "@conditional.inner", "@loop.inner" },
				}),
			},
		})

		require("mini.surround").setup()

		local statusline = require("mini.statusline")
		statusline.setup({
			use_icons = true,
			set_vim_settings = false,
		})
	end,
}
