---@type LazySpec
return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"onsails/lspkind.nvim",
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
			window = {
				documentation = cmp.config.window.bordered({ border = "single" }),
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
				{ name = "path" },
				{ name = "buffer", max_item_count = 10 },
			},
			---@type cmp.FormattingConfig
			formatting = {
				format = require("lspkind").cmp_format({
					mode = "text",
					maxwidth = function()
						return math.floor(vim.o.columns * 0.20)
					end,
					ellipsis_char = "...",
					menu = {
						buffer = "[Buf]",
						nvim_lsp = "[LSP]",
					},
				}),
			},
			preselect = cmp.PreselectMode.None,
		}
	end,
}
