return {
	{
		"L3MON4D3/LuaSnip",
		version = "2.*",
		build = "make install_jsregexp",
		event = "InsertEnter",
		dependencies = {
			{ "rafamadriz/friendly-snippets", enabled = false },
		},
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
				silent = true,
				desc = "Expand current snippet or jump to the next",
			},
		},
	},
}
