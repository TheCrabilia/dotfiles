---@type LazySpec
return {
	{
		"saghen/blink.cmp",
		event = "InsertEnter",
		version = "v0.*",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				preset = "default",
			},
			completion = {
				accept = {
					auto_brackets = {
						enabled = false,
					},
				},
				documentation = {
					auto_show = true,
					window = {
						border = "rounded",
					},
				},
			},
			signature = {
				enabled = true,
				window = {
					border = "rounded",
				},
			},
			sources = {
				default = function()
					local success, node = pcall(vim.treesitter.get_node)
					if
						success
						and node
						and vim.tbl_contains({ "comment", "line_comment", "block_comment" }, node:type())
					then
						return { "buffer" }
					else
						return { "lazydev", "lsp", "path", "snippets", "buffer" }
					end
				end,
				cmdline = {},
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},
		},
	},
	{
		"hrsh7th/nvim-cmp",
		enabled = false,
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
	},
}
