return {
	"williamboman/mason.nvim",
	lazy = false,
	build = function()
		vim.cmd.MasonUpdate()
	end,
	config = function()
		require("mason").setup()

		-- Run custom mason post install handlers
		require("mason-registry"):on(
			"package:install:success",
			vim.schedule_wrap(require("utils.lsp").mason_post_install)
		)
	end,
}
