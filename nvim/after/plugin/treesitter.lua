require("nvim-treesitter.configs").setup({
	ensure_installed = { "python", "go", "lua", "help" },
	sync_install = true,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
		disable = { "yaml", "python" },
	},

	-- Treesitter plugins
	autopairs = {
		enable = true,
	},
	playground = {
		enable = true,
	},
})
