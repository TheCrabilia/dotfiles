local cmp_ok, cmp = pcall(require, "cmp")
if not cmp_ok then
	return
end

local luasnip_ok, luasnip = pcall(require, "luasnip")
if not luasnip_ok then
	return
end

local lspkind_ok, lspkind = pcall(require, "lspkind")
if not lspkind_ok then
	return
end

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
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
		{ name = "nvim_lsp", group_index = 2 },
		{ name = "copilot", group_index = 1 },
		{ name = "luasnip", group_index = 2 },
		{ name = "luasnip_choice", group_index = 2 },
		{ name = "nvim_lua", group_index = 2 },
		{ name = "nvim_lsp_signature_help", group_index = 2 },
	}, {
		{ name = "buffer" },
	}),
	sorting = {
		priority_weight = 2,
		comparators = {
			require("copilot_cmp.comparators").prioritize,

			cmp.config.compare.offset,
			-- cmp.config.compare.scopes,
			cmp.config.compare.exact,
			cmp.config.compare.score,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
	formatting = {
		format = lspkind.cmp_format({
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
})

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
