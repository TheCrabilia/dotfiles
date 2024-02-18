return {
	"L3MON4D3/LuaSnip",
	version = "2.*",
	build = "make install_jsregexp",
	event = "InsertEnter",
	opts = function()
		local types = require("luasnip.util.types")
		return {
			history = true,
			updateevents = "TextChanged,TextChangedI",
			enable_autosnippets = true,
			ext_opts = {
				[types.choiceNode] = {
					active = {
						virt_text = { { "<-", "Error" } },
					},
				},
			},
		}
	end,
	config = function(_, opts)
		require("luasnip").setup(opts)
		require("snippets").load()
	end,
}
