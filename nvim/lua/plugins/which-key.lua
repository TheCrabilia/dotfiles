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
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)

		local nvim_tmux_nav = require("nvim-tmux-navigation")
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
				["<M-h>"] = { nvim_tmux_nav.NvimTmuxNavigateLeft, "Jump to left window" },
				["<M-j>"] = { nvim_tmux_nav.NvimTmuxNavigateDown, "Jump to bottom window" },
				["<M-k>"] = { nvim_tmux_nav.NvimTmuxNavigateUp, "Jump to top window" },
				["<M-l>"] = { nvim_tmux_nav.NvimTmuxNavigateRight, "Jump to right window" },
				mode = { "n", "t" },
			},
		}
		wk.register(keymaps)
	end,
}
