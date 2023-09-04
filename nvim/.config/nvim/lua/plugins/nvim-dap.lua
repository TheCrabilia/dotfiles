return {
	{
		"mfussenegger/nvim-dap",
		enabled = false,
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
		end,
		keys = {
			{
				"<leader>ps",
				mode = "n",
				function()
					require("dap").continue()
				end,
				desc = "Start Debug Session",
			},
			{
				"<leader>pt",
				mode = "n",
				function()
					require("dap").terminate()
				end,
				desc = "Terminate Debug Session",
			},
			{
				"<leader>pb",
				mode = "n",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Toggle Breakpoint",
			},
			{
				"<leader>plp",
				mode = "n",
				function()
					require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
				end,
				desc = "Set Breakpoint with Log Point Message",
			},
			{
				"<F1>",
				mode = "n",
				function()
					require("dap").step_out()
				end,
				desc = "Debug Step Out",
			},
			{
				"<F2>",
				mode = "n",
				function()
					require("dap").step_into()
				end,
				desc = "Debug Step Into",
			},
			{
				"<F3>",
				mode = "n",
				function()
					require("dap").step_over()
				end,
				desc = "Debug Step Over",
			},
			{
				"<F4>",
				mode = "n",
				function()
					require("dap").continue()
				end,
				desc = "Debug Continue",
			},
		},
	},
	{
		"rcarriga/nvim-dap-ui",
		enabled = false,
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
		keys = {
			{
				"<leader>puo",
				mode = "n",
				function()
					require("dapui").open()
				end,
				desc = "Open UI",
			},
			{
				"<leader>puc",
				mode = "n",
				function()
					require("dapui").close()
				end,
				desc = "Close UI",
			},
		},
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		enabled = false,
		event = "VeryLazy",
		dependencies = {
			"mason.nvim",
		},
		opts = {
			ensure_installed = { "javadbg", "python" },
			handlers = {},
		},
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		enabled = false,
		dependencies = { "nvim-dap" },
		opts = {},
	},
}
