return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			local set = vim.keymap.set
			set("n", "<leader>ps", dap.continue, { desc = "Start Debug Session" })
			set("n", "<leader>pt", dap.terminate, { desc = "Terminate Debug Session" })
			set("n", "<leader>pb", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
			set("n", "<leader>pB", dap.set_breakpoint, { desc = "Set Breadpoint" })
			set("n", "<leader>plp", function()
				dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
			end, { desc = "Set Breakpoint with Log Point Message" })
			set("n", "<leader>puo", dapui.open, { desc = "Open DAP UI" })
			set("n", "<leader>puc", dapui.close, { desc = "Close DAP UI" })
			set("n", "<F1>", dap.step_out, { desc = "Debug Step Out" })
			set("n", "<F2>", dap.step_into, { desc = "Debug Step Into" })
			set("n", "<F3>", dap.step_over, { desc = "Debug Step Over" })
			set("n", "<F4>", dap.continue, { desc = "Debug Continue" })
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "nvim-dap" },
		opts = {
			layouts = {
				{
					elements = {
						{ id = "scopes", size = 0.25 },
						{ id = "breakpoints", size = 0.25 },
					},
					size = 40,
					position = "left",
				},
				{
					elements = {
						"console",
					},
					size = 0.25,
					position = "bottom",
				},
			},
		},
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			"mason.nvim",
			"nvim-dap",
		},
		opts = {
			ensure_installed = { "javadbg", "python" },
			handlers = {},
		},
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		dependencies = {
			"nvim-dap",
		},
		config = true,
	},
}
