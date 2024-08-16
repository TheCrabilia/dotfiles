---@type LazySpec
return {
	"rcarriga/nvim-dap-ui",
	enabled = false,
	dependencies = {
		"nvim-dap",
		"neodev.nvim",
		"nvim-neotest/nvim-nio",
	},
	opts = {},
	keys = function()
		return {
			{
				"<leader>po",
				mode = "n",
				require("dapui").open,
				desc = "Open UI",
			},
		}
	end,
}
