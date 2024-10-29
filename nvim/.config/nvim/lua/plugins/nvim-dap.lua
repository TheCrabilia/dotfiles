---@type LazySpec
return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"theHamsta/nvim-dap-virtual-text",
		},
		keys = {
			{
				"<F1>",
				mode = "n",
				function()
					require("dap").step_out()
				end,
				desc = "Step Out",
			},
			{
				"<F2>",
				mode = "n",
				function()
					require("dap").step_into()
				end,
				desc = "Step Into",
			},
			{
				"<F3>",
				mode = "n",
				function()
					require("dap").step_over()
				end,
				desc = "Step Over",
			},
			{
				"<F5>",
				mode = "n",
				function()
					require("dap").continue()
				end,
				desc = "Continue",
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
				"<leader>pB",
				mode = "n",
				function()
					require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
				end,
				desc = "Set Breakpoint with Condition",
			},
			{
				"<leader>plp",
				mode = "n",
				function()
					require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
				end,
				desc = "Set Breakpoint with Log Point Message",
			},
		},
	},
	{
		"mfussenegger/nvim-dap-python",
		enabled = false,
		ft = { "python" },
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		opts = function()
			return {
				python_interpreter = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python",
				test_runner = "pytest",
				opts = {
					include_configs = true,
					console = "integratedTerminal",
				},
			}
		end,
		config = function(_, opts)
			local python_dap = require("dap-python")
			python_dap.setup(opts.python_interpreter, opts.opts)
			python_dap.test_runner = opts.test_runner

			vim.keymap.set("n", "<leader>pm", python_dap.test_method, { desc = "Test method" })
		end,
	},
	{
		"leoluz/nvim-dap-go",
		ft = "go",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		opts = {},
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		opts = {},
		config = function(_, opts)
			local dapui = require("dapui")

			dapui.setup(opts)

			local dap = require("dap")
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
		keys = {
			{
				"<leader>po",
				mode = "n",
				function()
					require("dapui").open()
				end,
				desc = "Open UI",
			},
		},
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		lazy = true,
		opts = {},
		keys = {
			{
				"<leader>pv",
				function()
					vim.cmd.DapVirtualTextToggle()
				end,
				desc = "Toggle Virtual Text",
			},
		},
	},
}
