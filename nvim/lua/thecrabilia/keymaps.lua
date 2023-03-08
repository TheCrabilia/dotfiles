local wk = require("which-key")
local dap = require("dap")
local telescope = require("telescope.builtin")
local hop = require("hop")
local hop_directions = require("hop.hint").HintDirection

-- Normal mode keymaps
wk.register({
	{
		s = { vim.cmd.write, "Save current file" },
		prefix = "<leader>",
	},
	{
		["<M-h>"] = {
			function()
				vim.cmd.wincmd("h")
			end,
			"Jump to window at left",
		},
		["<M-j>"] = {
			function()
				vim.cmd.wincmd("j")
			end,
			"Jump to window at bottom",
		},
		["<M-k>"] = {
			function()
				vim.cmd.wincmd("k")
			end,
			"Jump to windows at top",
		},
		["<M-l>"] = {
			function()
				vim.cmd.wincmd("l")
			end,
			"Jump to window at right",
		},
		mode = { "n", "t" },
	},
	-- Buffers and tabs
	L = { vim.cmd.TablineBufferNext, "Next Buffer" },
	H = { vim.cmd.TablineBufferPrevious, "Previous Buffer" },
	{
		w = { vim.cmd.bdelete, "Close Current Buffer" },
		t = {
			name = "Tabs",
			c = {
				function()
					vim.ui.input({ prompt = "Enter new tab files: " }, function(input)
						vim.cmd.TablineTabNew(input)
					end)
				end,
				"Create a New Tab",
			},
			r = {
				function()
					vim.ui.input({ prompt = "Tab name: " }, function(input)
						input = input or ""
						vim.cmd.TablineTabRename(input)
					end)
				end,
				"Rename a Tab",
			},
			l = { vim.cmd.tabnext, "Next Tab" },
			h = { vim.cmd.tabprevious, "Previous Tab" },
		},
		prefix = "<leader>",
	},
	-- Git
	{
		name = "Git",
		g = { vim.cmd.Git, "Open Git" },
		p = {
			function()
				vim.cmd.Git("push")
			end,
			"Git push",
		},
		P = {
			function()
				vim.cmd.Git("pull")
			end,
			"Git pull",
		},
		f = {
			function()
				vim.cmd.Git("fetch")
			end,
			"Git fetch",
		},
		prefix = "<leader>g",
	},
	-- Hop
	{
		name = "Hop",
		remap = true,
		f = {
			function()
				hop.hint_char1({ direction = hop_directions.AFTER_CURSOR, current_line_only = true })
			end,
			"Jump to character after cursor",
		},
		F = {
			function()
				hop.hint_char1({ direction = hop_directions.BEFORE_CURSOR, current_line_only = true })
			end,
			"Jump to character before cursor",
		},
		t = {
			function()
				hop.hint_char1({ direction = hop_directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
			end,
			"Jump before character after cursor",
		},
		T = {
			function()
				hop.hint_char1({ direction = hop_directions.BEFORE_CURSOR, current_line_only = true, hint_offset = -1 })
			end,
			"Jump before character before cursor",
		},
	},
	-- Debugging
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
		},
		prefix = "<leader>",
	},
	["<F5>"] = { dap.continue, "Debug continue" },
	["<F10>"] = { dap.step_over, "Debug step over" },
	["<F11>"] = { dap.step_into, "Debug step into" },
	["<F12>"] = { dap.step_out, "Debug step out" },
	-- Cool keymaps
	["<C-c>"] = { "<ESC>", "Ctrl-C as ESC", mode = "i" },
	{
		J = { ":m '>+1<CR>gv=gv", "Move selection down" },
		K = { ":m '<-2<CR>gv=gv", "Move selection up" },
		mode = "v",
	},
	J = { "mzJ'z", "Join lines" },
	{
		{ y = { '"+y', "Copy to system clipboard" } },
		{
			y = { '"+y', "Copy to system clipboard" },
			mode = "v",
		},
		prefix = "<leader>",
	},
	-- Source file keymaps
	{
		name = "Source config files",
		p = {
			function()
				local file_name = "~/.config/nvim/lua/thecrabilia/packer.lua"

				if vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()) == file_name then
					vim.cmd.write()
				end
				vim.cmd.source(file_name)
				vim.cmd.PackerSync()
			end,
			"Packer source and sync",
		},
		s = {
			function()
				local file_name = "~/.config/nvim/lua/thecrabilia/snippets.lua"

				if vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()) == file_name then
					vim.cmd.write()
				end
				vim.cmd.source(file_name)
			end,
			"Source snippets config file",
		},
		c = {
			function()
				vim.cmd.write()
				vim.cmd.source()
			end,
			"Source current file",
		},
		prefix = "<leader><leader>",
	},
})

-- Keymaps for LSP on_attach
local M = {}
M.lsp_on_attach = function(bufnr)
	wk.register({
		K = { vim.lsp.buf.hover, "Help" },
		{
			l = {
				name = "LSP",
				R = { vim.lsp.buf.rename, "Rename" },
				f = { vim.lsp.buf.format, "Format Document" },
				a = { vim.lsp.buf.code_action, "Code Action" },
				d = { telescope.lsp_definitions, "Definitions" },
				t = { telescope.lsp_type_definitions, "Type Definitions" },
				i = { telescope.lsp_implementations, "Implementations" },
				r = { telescope.lsp_references, "References" },
			},
			d = {
				name = "Diagnostics",
				n = { vim.diagnostic.goto_next, "Move to the next diagnostic" },
				p = { vim.diagnostic.goto_prev, "Move to the previous diagnostic" },
				l = { telescope.diagnostics, "List diagnostics" },
			},
			prefix = "<leader>",
		},
		buffer = bufnr,
		remap = false,
	})
end

return M
