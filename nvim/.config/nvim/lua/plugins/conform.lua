return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
	opts = {
		notify_on_error = false,
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_fix", "ruff_format" },
			go = { "goimports", "gofmt" },
			terraform = { "terraform_fmt" },
			c = { "clang_format" },
			cpp = { "clang_format" },
			java = { "clang_format" },
			["_"] = { "trim_whitespace" },
		},
		formatters = {
			clang_format = {
				inherit = true,
				prepend_args = {
					"-style={BasedOnStyle: Google, UseTab: Always, IndentWidth: 4, TabWidth: 4, ColumnLimit: 120}",
				},
			},
		},
	},
	keys = {
		{
			"<leader>lf",
			mode = { "n", "v" },
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
		},
	},
}
