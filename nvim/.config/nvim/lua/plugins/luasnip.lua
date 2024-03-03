return {
	"L3MON4D3/LuaSnip",
	version = "2.*",
	build = "make install_jsregexp",
	event = "InsertEnter",
	opts = {},
	config = function(_, opts)
		require("luasnip").setup(opts)
		require("snippets").load()
	end,
}
