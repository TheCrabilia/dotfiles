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

      local nvim_tmux_nav = require('nvim-tmux-navigation')
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
              nvim_tmux_nav.NvimTmuxNavigateLeft()
						end,
						"Jump to left window",
					},
					["<M-j>"] = {
						function()
              nvim_tmux_nav.NvimTmuxNavigateDown()
						end,
						"Jump to bottom window",
					},
					["<M-k>"] = {
						function()
              nvim_tmux_nav.NvimTmuxNavigateUp()
						end,
						"Jump to top window",
					},
					["<M-l>"] = {
						function()
              nvim_tmux_nav.NvimTmuxNavigateRight()
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
