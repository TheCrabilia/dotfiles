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
		return {
			---@type cmp.SnippetConfig
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			---@type cmp.Mapping
			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-y>"] = cmp.mapping(
					cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Insert,
						select = true,
					}),
					{ "i", "c" }
				),
			}),
			---@type cmp.CompletionConfig
			completion = {
				completeopt = "menu,menuone,noselect",
			},
			---@type cmp.SourceConfig
			sources = {
				{ name = "nvim_lsp" },
				-- { name = "luasnip", max_item_count = 5 },
				{ name = "buffer", max_item_count = 10 },
			},
			---@type cmp.FormattingConfig
			formatting = {
				format = function(entry, vim_item)
					-- Remove the kind from the completion menu
					-- TODO: Maybe add icons
					vim_item.kind = nil

					local maxwidth = 30
					if vim.fn.strchars(vim_item.abbr) > maxwidth then
						vim_item.abbr = vim.fn.strcharpart(vim_item.abbr, 0, maxwidth) .. "..."
					end

					local source_menu = {
						nvim_lsp = "[LSP]",
						luasnip = "[Snp]",
						buffer = "[Buf]",
					}
					vim_item.menu = string.format("%s %s", source_menu[entry.source.name], vim_item.menu or "")

					return vim_item
				end,
			},
			preselect = cmp.PreselectMode.None,
		}
	end,
}
