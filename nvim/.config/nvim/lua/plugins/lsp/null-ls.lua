return {
	"nvimtools/none-ls.nvim",
	event = { "BufReadPost" },
	dependencies = { "plenary.nvim" },
	opts = function()
		local formatting = require("null-ls").builtins.formatting
		local diagnostics = require("null-ls").builtins.diagnostics
		local code_actions = require("null-ls").builtins.code_actions
		return {
			sources = {
				-- lua
				formatting.stylua,

				-- golang
				formatting.goimports,
				formatting.gofmt,
				code_actions.impl,

				-- c/c++, java
				formatting.clang_format.with({
					extra_args = {
						"--style='{BasedOnStyle: Google, UseTab: Always, IndentWidth: 4, TabWidth: 4, ColumnLimit: 120}'",
					},
				}),

				-- terraform
				formatting.terraform_fmt,

				-- js, ts, css
				formatting.prettierd.with({
					disabled_filetypes = { "json", "jsonc" },
				}),

				-- sql
				formatting.sqlfluff.with({
					extra_args = { "--dialect", "postgres" },
				}),
				diagnostics.sqlfluff.with({
					extra_args = { "--dialect", "postgres" },
				}),
			},
		}
	end,
}
