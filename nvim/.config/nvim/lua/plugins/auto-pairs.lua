return {
	"windwp/nvim-autopairs",
	enabled = false,
	event = "InsertEnter",
	dependencies = { "nvim-treesitter" },
	opts = {
		check_ts = true,
		ts_config = {},
	},
}
