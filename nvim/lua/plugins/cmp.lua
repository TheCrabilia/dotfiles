return {
	{
		"hrsh7th/nvim-cmp",
		event = { "VeryLazy" },
		dependencies = {
			"LuaSnip",
			"onsails/lspkind.nvim",
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
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "nvim_lsp_signature_help" },
					{ name = "nvim_lua" },
				}, {
					{ name = "path" },
					{ name = "luasnip", max_item_count = 5 },
					{ name = "luasnip_choice" },
				}, {
					{ name = "copilot" },
				}, {
					{ name = "buffer" },
				}),
				formatting = {
					format = require("lspkind").cmp_format({
						mode = "text",
						maxwidth = 50,
						ellipsis_chat = "...",
						symbol_map = {
							Text = "󰉿",
							Method = "󰆧",
							Function = "󰊕",
							Constructor = "",
							Field = "󰜢",
							Variable = "󰀫",
							Class = "󰠱",
							Interface = "",
							Module = "",
							Property = "󰜢",
							Unit = "󰑭",
							Value = "󰎠",
							Enum = "",
							Keyword = "󰌋",
							Snippet = "",
							Color = "󰏘",
							File = "󰈙",
							Reference = "󰈇",
							Folder = "󰉋",
							EnumMember = "",
							Constant = "󰏿",
							Struct = "󰙅",
							Event = "",
							Operator = "󰆕",
							TypeParameter = "",
						},
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
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			cmp.setup(opts)

			cmp.setup.filetype("gitcommit", {
				sources = cmp.config.sources({
					{ name = "cmp_git" },
				}, {
					{ name = "buffer" },
				}),
			})

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

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})

			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
	{
		"hrsh7th/cmp-nvim-lsp",
		event = "InsertEnter",
		dependencies = { "nvim-cmp" },
	},
	{
		"hrsh7th/cmp-nvim-lua",
		event = "InsertEnter",
		dependencies = { "nvim-cmp" },
	},
	{
		"hrsh7th/cmp-buffer",
		event = "InsertEnter",
		dependencies = { "nvim-cmp" },
	},
	{
		"hrsh7th/cmp-path",
		event = "InsertEnter",
		dependencies = { "nvim-cmp" },
	},
	{
		"hrsh7th/cmp-cmdline",
		event = "CmdlineChanged",
		dependencies = { "nvim-cmp" },
	},
	{
		"hrsh7th/cmp-nvim-lsp-signature-help",
		event = "InsertEnter",
		dependencies = { "nvim-cmp" },
	},
	{
		"petertriho/cmp-git",
		event = "CmdlineChanged",
		dependencies = { "nvim-cmp" },
	},
	{
		"saadparwaiz1/cmp_luasnip",
		event = "InsertEnter",
		dependencies = { "nvim-cmp" },
	},
	{
		"doxnit/cmp-luasnip-choice",
		event = "InsertEnter",
		dependencies = { "nvim-cmp" },
	},
	{
		"zbirenbaum/copilot-cmp",
		event = "InsertEnter",
		dependencies = { "nvim-cmp" },
		cond = function()
			return require("utils.lazy").has("copilot.lua")
		end,
	},
}
