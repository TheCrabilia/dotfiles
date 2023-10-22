return {
	"folke/neodev.nvim",
	event = { "BufEnter *.lua" },
	opts = {
		library = {
			plugins = {
				"nvim-dap-ui",
			},
			types = true,
		},
	},
}
