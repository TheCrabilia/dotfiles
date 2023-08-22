return {
	"akinsho/toggleterm.nvim",
	enabled = false,
	opts = {},
	keys = {
		{
			"<C-\\",
			mode = { "n", "t" },
			function()
				require("toggleterm").toggle(1, 20, ".", "horizontal")
			end,
			desc = "Toggle Terminal",
		},
	},
}
