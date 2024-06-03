---@type LazySpec
return {
	{
		"tpope/vim-fugitive",
		enabled = false,
		config = function()
			local map = vim.keymap.set

			map("n", "<leader>gg", vim.cmd.Git, { desc = "Open Git" })
			map("n", "<leader>gp", function()
				vim.cmd.Git("push")
			end, { desc = "Git Push" })
			map("n", "<leader>gP", function()
				vim.cmd.Git("pull")
			end, { desc = "Git Pull" })
			map("n", "<leader>gf", function()
				vim.cmd.Git("fetch")
			end, { desc = "Git Fetch" })
			map("n", "<leader>gl", function()
				vim.cmd.Git("log")
			end, { desc = "Git Log" })
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			local gitsigns = require("gitsigns")
			gitsigns.setup({
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "~" },
				},
			})

			local map = vim.keymap.set
			map("n", "<leader>gs", gitsigns.preview_hunk_inline, { desc = "Preview hunk" })
			map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "Reset hunk" })
		end,
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"sindrets/diffview.nvim",
		},
		opts = {
			kind = "split",
			disable_hint = true,
			disable_context_highlighting = true,
			disable_insert_on_commit = true,
			git_services = {
				["github.com"] = "https://github.com/${owner}/${repository}/compare/${branch_name}?expand=1",
				["bitbucket.org"] = "https://bitbucket.org/${owner}/${repository}/pull-requests/new?source=${branch_name}&t=1",
				["gitlab.com"] = "https://gitlab.com/${owner}/${repository}/merge_requests/new?merge_request[source_branch]=${branch_name}",
				["code.swisscom.com"] = "https://code.swisscom.com/${owner}/${repository}/merge_requests/new?merge_request[source_branch]=${branch_name}",
			},
			highlight = {
				italic = false,
			},
		},
		keys = {
			{
				"<leader>gg",
				mode = "n",
				function()
					require("neogit").open()
				end,
				desc = "Open Neogit",
			},
		},
	},
}
