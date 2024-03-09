---@type LazySpec
return {
	"mfussenegger/nvim-dap-python",
	ft = { "python" },
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
}
