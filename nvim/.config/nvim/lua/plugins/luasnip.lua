---@type LazySpec
return {
	"L3MON4D3/LuaSnip",
	event = "BufReadPost",
	version = "*",
	build = "make install_jsregexp",
	config = function()
		local ls = require("luasnip")

		ls.config.set_config({
			history = false,
			updateevents = "TextChanged,TextChangedI",
		})

		for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/snippets/*.lua", true)) do
			loadfile(ft_path)()
		end
	end,
	keys = {
		{
			"<C-k>",
			mode = { "i", "s" },
			function()
				local ls = require("luasnip")

				if ls.expand_or_jumpable() then
					ls.expand_or_jump()
				end
			end,
		},
		{
			"<C-j>",
			mode = { "i", "s" },
			function()
				local ls = require("luasnip")

				if ls.jumpable(-1) then
					ls.jump(-1)
				end
			end,
		},
	},
}
