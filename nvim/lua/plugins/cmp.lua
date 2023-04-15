return {
	{
		"hrsh7th/nvim-cmp",
		event = { "VeryLazy" },
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
			{ "hrsh7th/cmp-nvim-lsp-signature-help" },
			{ "petertriho/cmp-git" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "doxnit/cmp-luasnip-choice" },
			{ "onsails/lspkind.nvim" },
			{
				"zbirenbaum/copilot-cmp",
				cond = function()
					return require("utils.lazy").has("copilot.lua")
				end,
			},
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
						mode = "symbol_text",
						maxwidth = 50,
						ellipsis_chat = "...",
						symbol_map = {
							["Function"] = "",
							["Method"] = "",
							["Constructor"] = "",
							["Copilot"] = "",
							["Field"] = "ﰠ",
							["Variable"] = "",
							["Class"] = "ﴯ",
							["Interface"] = "",
							["Module"] = "",
							["Property"] = "ﰠ",
							["Unit"] = "塞",
							["Value"] = "",
							["Enum"] = "",
							["Keyword"] = "",
							["Snippet"] = "",
							["Color"] = "",
							["File"] = "",
							["Reference"] = "",
							["Folder"] = "",
							["EnumMember"] = "",
							["Constant"] = "",
							["Struct"] = "פּ",
							["Event"] = "",
							["Operator"] = "",
							["TypeParameter"] = "",
						},
					}),
				},
				experimental = {
					ghost_text = false,
					native_menu = false,
				},
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
}
