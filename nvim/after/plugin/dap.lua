local dap_ok, dap = pcall(require, "dap")
if not dap_ok then
	return
end
local dapui_ok, dapui = pcall(require, "dapui")
if not dap_ok then
	return
end

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

require("mason-nvim-dap").setup({
	ensure_installed = {},
	automatic_setup = false,
})

require("mason-nvim-dap").setup_handlers({})

require("neodev").setup({
	library = { plugins = "nvim-dap-ui", types = true },
})

require("which-key").register({
	{
		p = {
			name = "Debug",
			s = { dap.continue, "Start Debug session" },
			t = { dap.terminate, "Terminate Debug session" },
			b = { dap.toggle_breakpoint, "Toggle Breakpoint" },
			B = { dap.set_breakpoint, "Set Breakpoint" },
			lp = {
				function()
					dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
				end,
				"Set Breakpoint with Log Point Message",
			},
			u = {
				name = "UI",
				o = {
					function()
						require("dapui").open()
					end,
					"Open dap UI",
				},
				c = {
					function()
						require("dapui").close()
					end,
					"Close dap UI",
				},
			},
		},
		prefix = "<leader>",
	},
	["<F1>"] = { dap.step_out, "Debug step out" },
	["<F2>"] = { dap.step_into, "Debug step into" },
	["<F3>"] = { dap.step_over, "Debug step over" },
	["<F4>"] = { dap.continue, "Debug continue" },
})
