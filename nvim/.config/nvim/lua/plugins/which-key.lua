return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		plugins = {
			spelling = true,
			registers = false,
		},
		disable = {
			buftypes = { "Telescope" },
			filetypes = { "TelescopePrompt" },
		},
		keymaps = {
			-- Misc keymaps
			{
				["J"] = { "mzJ'z", "Join lines" },
				["<C-d>"] = { "<C-d>zz", "Page down" },
				["<C-u>"] = { "<C-u>zz", "Page up" },
				mode = "n",
			},
			{
				["J"] = { ":m '>+1<cr>gv=gv", "Move selection down" },
				["K"] = { ":m '<-2<cr>gv=gv", "Move selection up" },
				mode = "v",
			},
			{
				["<C-c>"] = { "<esc>", "Ctrl-C as ESC" },
				mode = "i",
			},
			{
				["<leader>y"] = { '"+y', "Copy to system clipboard" },
				mode = { "v", "n" },
			},
			-- Intermediate keymap descriptions
			{
				["<leader>"] = {
					["f"] = { desc = "Find" },
					["g"] = { desc = "Git" },
					["h"] = { desc = "Harpoon" },
					["l"] = { desc = "LSP" },
					["p"] = {
						desc = "Debug",
						["u"] = { desc = "UI" },
					},
				},
			},
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
		wk.register(opts.keymaps)
	end,
}
