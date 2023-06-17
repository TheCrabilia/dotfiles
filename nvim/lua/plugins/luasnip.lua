return {
	{
		"L3MON4D3/LuaSnip",
		version = "1.*",
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
			local ls = require("luasnip")
			ls.setup(opts)

			local set = vim.keymap.set
			set({ "i", "s" }, "<C-k>", function()
				if ls.expand_or_jumpable() then
					ls.expand_or_jump()
				end
			end, { silent = true, desc = "Expand current snippet or jump to the next" })
			set({ "i", "s" }, "<C-j>", function()
				if ls.is_jumpable(-1) then
					ls.jump(-1)
				end
			end, { silent = true, desc = "Jump to previous snippet" })
			set("i", "<C-l>", function()
				if ls.choice_active() then
					ls.change_choice(1)
				end
			end, { silent = true, desc = "Select node from list" })

			require("snippets").load()
		end,
	},
	{
		"rafamadriz/friendly-snippets",
		event = "InsertEnter",
		dependencies = {
			"LuaSnip",
		},
	},
}
