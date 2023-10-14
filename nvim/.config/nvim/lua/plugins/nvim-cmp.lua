return {
	{
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			"onsails/lspkind.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"saadparwaiz1/cmp_luasnip",
		},
		opts = function()
			local cmp = require("cmp")
			return {
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<Tab>"] = cmp.mapping.confirm({
						select = true,
					}),
				}),
				completion = {
					completeopt = "menu,menuone,preview,noselect",
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "nvim_lsp_signature_help" },
					{ name = "neorg" },
					{ name = "luasnip", max_item_count = 5 },
					{ name = "luasnip_choice" },
				}, {
					{ name = "path" },
				}, {
					{ name = "buffer" },
				}),
				formatting = {
					format = require("lspkind").cmp_format({
						mode = "text",
						maxwidth = 50,
						ellipsis_chat = "...",
					}),
				},
				experimental = {
					ghost_text = false,
				},
				preselect = cmp.PreselectMode.None,
			}
		end,
		config = function(_, opts)
			local cmp = require("cmp")
			cmp.setup(opts)

			cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
				sources = {
					{ name = "dap" },
				},
			})

			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})
		end,
	},
}
