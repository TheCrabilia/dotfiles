return {
	"zbirenbaum/copilot.lua",
	enabled = true,
	cmd = "Copilot",
	event = "InsertEnter",
	opts = {
		suggestion = {
			enabled = true,
			auto_trigger = true,
			debounce = 75,
			keymap = {
				accept_word = false,
				accept_line = false,
				accept = "<C-l>",
				next = "<C-n>",
				prev = "<C-p>",
				dismiss = "<C-e>",
			},
		},
		panel = {
			enabled = false,
		},
	},
	config = function(_, opts)
		require("copilot").setup(opts)

		vim.g.copilot_proxy = vim.fn.getenv("http_proxy")
		vim.g.copilot_proxy_strict_ssl = false
	end,
}
