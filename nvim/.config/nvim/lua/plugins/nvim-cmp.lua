---@type LazySpec
return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp-signature-help",
	},
	opts = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		return {
			---@type cmp.SnippetConfig
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			---@type cmp.Mapping
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
			---@type cmp.CompletionConfig
			completion = {
				completeopt = "menu,menuone,noselect,noinsert",
			},
			---@type cmp.SourceConfig
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip", max_item_count = 5 },
			}, {
				{ name = "nvim_lsp_signature_help" },
			}, {
				{ name = "buffer", max_item_count = 10 },
			}),
			---@type cmp.FormattingConfig
			formatting = {
				format = function(entry, vim_item)
					-- Remove the kind from the completion menu
					vim_item.kind = nil

					local source_menu = {
						nvim_lsp = "[LSP]",
						luasnip = "[Snp]",
						buffer = "[Buf]",
					}
					vim_item.menu = source_menu[entry.source.name] or ""

					return vim_item
				end,
			},
			preselect = cmp.PreselectMode.None,
		}
	end,
}
