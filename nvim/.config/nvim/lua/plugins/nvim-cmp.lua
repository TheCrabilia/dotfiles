return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"onsails/lspkind.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"saadparwaiz1/cmp_luasnip",
	},
	opts = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		return {
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-y>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Insert,
					select = true,
				}),
				["<C-k>"] = cmp.mapping(function(fallback)
					if luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<C-j>"] = cmp.mapping(function(fallback)
					if luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			completion = {
				completeopt = "menu,menuone,noselect,noinsert",
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip", max_item_count = 5 },
				{ name = "luasnip_choice" },
			}),
			formatting = {
				format = require("lspkind").cmp_format({
					mode = "text",
					maxwidth = 60,
					ellipsis_char = "...",
				}),
			},
			preselect = cmp.PreselectMode.None,
		}
	end,
}
