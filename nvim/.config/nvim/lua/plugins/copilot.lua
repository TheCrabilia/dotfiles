return {
	"zbirenbaum/copilot.lua",
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
				next = "<C-]>",
				prev = "<C-[>",
				dismiss = "<C-e>",
			},
		},
		panel = {
			enabled = false,
		},
		filetypes = {
			norg = false,
			lua = false,
		},
	},
	config = function(_, opts)
		require("copilot").setup(opts)

		vim.g.copilot_proxy = vim.fn.getenv("http_proxy")
		vim.g.copilot_proxy_strict_ssl = false
	end,
}
