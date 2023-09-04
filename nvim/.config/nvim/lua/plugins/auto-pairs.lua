return {
	"windwp/nvim-autopairs",
	event = { "InsertEnter" },
	dependencies = { "nvim-treesitter" },
	opts = {
		check_ts = true,
		ts_config = {},
	},
}
