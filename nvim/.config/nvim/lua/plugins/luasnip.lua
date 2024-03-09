---@type LazySpec
return {
	"L3MON4D3/LuaSnip",
	version = "2.*",
	build = "make install_jsregexp",
	event = "InsertEnter",
	config = function()
		require("luasnip").setup()
		require("core.snippets").load()
	end,
}
