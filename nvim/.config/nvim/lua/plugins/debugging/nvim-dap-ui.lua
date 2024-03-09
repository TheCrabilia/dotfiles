---@type LazySpec
return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"nvim-dap",
		"neodev.nvim",
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
