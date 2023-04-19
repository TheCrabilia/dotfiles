return {
	{
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
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)

			local keymaps = {
				{
					["L"] = { vim.cmd.bnext, "Next Buffer" },
					["H"] = { vim.cmd.bprevious, "Previous Buffer" },
					["J"] = { "mzJ'z", "Join lines" },
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
				{
					["<M-h>"] = {
						function()
							vim.cmd.wincmd("h")
						end,
						"Jump to left window",
					},
					["<M-j>"] = {
						function()
							vim.cmd.wincmd("j")
						end,
						"Jump to bottom window",
					},
					["<M-k>"] = {
						function()
							vim.cmd.wincmd("k")
						end,
						"Jump to top window",
					},
					["<M-l>"] = {
						function()
							vim.cmd.wincmd("l")
						end,
						"Jump to right window",
					},
					mode = { "n", "t" },
				},
			}
			wk.register(keymaps)
		end,
	},
}
