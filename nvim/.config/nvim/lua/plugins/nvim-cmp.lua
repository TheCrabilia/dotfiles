return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
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
					{ name = "cmdline" },
				}, {
					{ name = "path" },
				}),
			})

			-- NOTE: Not sure that this is useful

			-- local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			-- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
	{
		"hrsh7th/cmp-nvim-lsp",
		event = { "InsertEnter" },
		dependencies = { "nvim-cmp" },
	},
	{
		"hrsh7th/cmp-buffer",
		event = { "InsertEnter" },
		dependencies = { "nvim-cmp" },
	},
	{
		"hrsh7th/cmp-path",
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = { "nvim-cmp" },
	},
	{
		"hrsh7th/cmp-cmdline",
		event = { "CmdlineEnter" },
		dependencies = { "nvim-cmp" },
	},
	{
		"hrsh7th/cmp-nvim-lsp-signature-help",
		event = { "InsertEnter" },
		dependencies = { "nvim-cmp" },
	},
	{
		"petertriho/cmp-git",
		event = { "InsertEnter" },
		dependencies = { "nvim-cmp" },
	},
	{
		"saadparwaiz1/cmp_luasnip",
		event = { "InsertEnter" },
		dependencies = { "nvim-cmp" },
	},
	{
		"doxnit/cmp-luasnip-choice",
		enabled = true,
		event = { "InsertEnter" },
		dependencies = { "nvim-cmp" },
	},
}
