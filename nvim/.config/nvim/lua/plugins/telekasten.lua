return {
	"renerocksai/telekasten.nvim",
	cmd = { "Telekasten" },
	dependencies = { "telescope.nvim" },
	opts = {
		home = vim.fn.expand("~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Notes"),
		auto_set_filetype = false,
	},
}
