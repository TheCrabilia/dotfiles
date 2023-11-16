return {
	"williamboman/mason.nvim",
	event = "VeryLazy",
	build = function()
		vim.cmd.MasonUpdate()
	end,
	opts = {},
}
