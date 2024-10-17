---@type LazySpec
return {
	"echasnovski/mini.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
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

		local statusline = require("mini.statusline")
		statusline.setup({
			use_icons = true,
			set_vim_settings = false,
		})
		---@diagnostic disable-next-line: duplicate-set-field
		statusline.section_location = function()
			return "%2l:%-2v"
		end
		---@diagnostic disable-next-line: duplicate-set-field
		statusline.section_lsp = function() end

		-- Force set statusline for certain filetypes
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "lazy",
			callback = function()
				vim.wo.statusline = "%!v:lua.MiniStatusline.active()"
			end,
		})
	end,
}
