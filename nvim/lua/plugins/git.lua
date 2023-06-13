return {
	{
		"tpope/vim-fugitive",
		cmd = "Git",
		dependencies = { "tpope/vim-rhubarb" },
		init = function()
			local set = vim.keymap.set

			set("n", "<leader>gg", vim.cmd.Git, { desc = "Open Git" })
			set("n", "<leader>gp", function()
				vim.cmd.Git("push")
			end, { desc = "Git Push" })
			set("n", "<leader>gP", function()
				vim.cmd.Git("pull")
			end, { desc = "Git Pull" })
			set("n", "<leader>gf", function()
				vim.cmd.Git("fetch")
			end, { desc = "Git Fetch" })
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = function()
			return {
				on_attach = function(bufnr)
					local gs = require("gitsigns")

					local function map(mode, l, r, opts)
						opts = opts or {}
						opts.buffer = bufnr
						vim.keymap.set(mode, l, r, opts)
					end

					map("n", "]c", function()
						if vim.wo.diff then
							return "]c"
						end
						vim.schedule(function()
							gs.next_hunk()
						end)
						return "<Ignore>"
					end, { expr = true, desc = "Jump to the next hunk" })

					map("n", "[c", function()
						if vim.wo.diff then
							return "[c"
						end
						vim.schedule(function()
							gs.prev_hunk()
						end)
						return "<Ignore>"
					end, { expr = true, desc = "Jump to the previous hunk" })

					map("n", "<leader>gs", gs.preview_hunk_inline, { desc = "Preview hunk" })
					map("n", "<leader>gr", gs.reset_hunk, { desc = "Reset hunk" })
				end,
			}
		end,
	},
}
