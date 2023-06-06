return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		enabled = true,
		opts = {
			suggestion = {
				enabled = true,
				auto_trigger = true,
				debounce = 75,
				keymap = {
					accept = "<C-j>",
					accept_word = false,
					accept_line = false,
					next = "<C-l>",
					prev = "<C-h>",
					dismiss = "<C-e>",
				},
			},
			panel = {
				enabled = false,
			},
		},
	},
}
