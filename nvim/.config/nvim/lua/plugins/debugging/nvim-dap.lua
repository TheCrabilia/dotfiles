---@type LazySpec
return {
	"mfussenegger/nvim-dap",
	dependencies = { "nvim-dap-virtual-text" },
	keys = function()
		local dap = require("dap")
		return {
			{
				"<F1>",
				mode = "n",
				dap.step_out,
				desc = "Step Out",
			},
			{
				"<F2>",
				mode = "n",
				dap.step_into,
				desc = "Step Into",
			},
			{
				"<F3>",
				mode = "n",
				dap.step_over,
				desc = "Step Over",
			},
			{
				"<F5>",
				mode = "n",
				dap.continue,
				desc = "Continue",
			},
			{
				"<leader>pt",
				mode = "n",
				dap.terminate,
				desc = "Terminate Debug Session",
			},
			{
				"<leader>pb",
				mode = "n",
				dap.toggle_breakpoint,
				desc = "Toggle Breakpoint",
			},
			{
				"<leader>pB",
				mode = "n",
				function()
					dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
				end,
				desc = "Set Breakpoint with Condition",
			},
			{
				"<leader>plp",
				mode = "n",
				function()
					dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
				end,
				desc = "Set Breakpoint with Log Point Message",
			},
		}
	end,
}
