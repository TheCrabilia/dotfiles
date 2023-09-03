return {
	"jose-elias-alvarez/null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "plenary.nvim" },
	opts = function()
		local formatting = require("null-ls").builtins.formatting
		local diagnostics = require("null-ls").builtins.diagnostics
		return {
			sources = {
				formatting.black,
				formatting.ruff,
				formatting.stylua,
				formatting.gofmt,
				formatting.goimports,
				formatting.beautysh,
				formatting.fixjson,
				formatting.terraform_fmt,
				formatting.prettierd,
				diagnostics.zsh,
			},
		}
	end,
}
