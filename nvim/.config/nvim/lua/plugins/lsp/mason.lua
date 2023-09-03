return {
	"williamboman/mason.nvim",
	build = function()
		vim.cmd.MasonUpdate()
	end,
	cmd = { "Mason", "MasonInstall", "MasonUninstall" },
	config = function()
		require("mason").setup()

		-- Run custom mason post install handlers
		require("mason-registry"):on(
			"package:install:success",
			vim.schedule_wrap(require("utils.lsp").mason_post_install)
		)
	end,
}
