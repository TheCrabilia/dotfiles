return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		enabled = true,
		opts = {
			suggestion = {
				enabled = true,
				auto_trigger = false,
				debounce = 75,
				keymap = {
					accept = "<C-j>",
					accept_word = false,
					accept_line = false,
					next = "<C-h>",
					prev = "<C-l>",
					dismiss = "<C-e>",
				},
			},
			panel = {
				enabled = false,
			},
		},
		config = function(_, opts)
			require("copilot").setup(opts)

			local set = vim.keymap.set
		end,
	},
}
