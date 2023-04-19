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
			set("n", "<leader>ps", function()
				dap.continue()
			end, { desc = "Start Debug Session" })
			set("n", "<leader>pt", function()
				dap.terminate()
			end, { desc = "Terminate Debug Session" })
			set("n", "<leader>pb", function()
				dap.toggle_breakpoint()
			end, { desc = "Toggle Breakpoint" })
			set("n", "<leader>pB", function()
				dap.set_breakpoint()
			end, { desc = "Set Breadpoint" })
			set("n", "<leader>plp", function()
				dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
			end, { desc = "Set Breakpoint with Log Point Message" })
			set("n", "<leader>puo", function()
				dapui.open()
			end, { desc = "Open DAP UI" })
			set("n", "<leader>puc", function()
				dapui.close()
			end, { desc = "Close DAP UI" })
			set("n", "<F1>", function()
				dap.step_out()
			end, { desc = "Debug Step Out" })
			set("n", "<F2>", function()
				dap.step_into()
			end, { desc = "Debug Step Into" })
			set("n", "<F3>", function()
				dap.step_over()
			end, { desc = "Debug Step Over" })
			set("n", "<F4>", function()
				dap.continue()
			end, { desc = "Debug Continue" })
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
}
