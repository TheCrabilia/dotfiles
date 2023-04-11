return {
	{
		"akinsho/toggleterm.nvim",
		event = "VeryLazy",
		config = function()
			local toggleterm = require("toggleterm")
			toggleterm.setup()

			local set = vim.keymap.set
			set({ "n", "t" }, "<C-\\>", function()
				toggleterm.toggle(1, 20, ".", "horizontal")
			end, { desc = "Toggle Terminal" })
		end,
	},
}
