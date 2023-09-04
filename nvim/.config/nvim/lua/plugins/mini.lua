return {
	{
		"echasnovski/mini.nvim",
		version = false,
	},
	{
		"echasnovski/mini.indentscope",
		version = false,
		event = { "BufReadPre", "BufNewFile" },
		main = "mini.indentscope",
		dependencies = { "mini.nvim" },
		opts = function()
			return {
				disable_filetypes = {
					"lazy",
					"help",
				},
				draw = {
					animation = require("mini.indentscope").gen_animation.none(),
				},
				symbol = "┆",
			}
		end,
		config = function(_, opts)
			require("mini.indentscope").setup(opts)

			-- vim.api.nvim_create_autocmd("BufEnter", {
			-- 	group = vim.api.nvim_create_augroup("MiniIndentscope", { clear = true }),
			-- 	pattern = opts.disable_filetypes,
			-- 	callback = function()
			-- 		vim.b.miniindentscope_disable = true
			-- 	end,
			-- })
		end,
	},
	{
		"echasnovski/mini.ai",
		version = false,
		event = { "BufReadPre", "BufNewFile" },
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
