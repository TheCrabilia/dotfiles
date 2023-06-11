return {
	{
		"ThePrimeagen/harpoon",
		opts = function()
			return {
				menu = {
					width = math.floor(vim.api.nvim_win_get_width(0) * 0.6),
				},
			}
		end,
		config = function(_, opts)
			require("harpoon").setup(opts)

			local set = vim.keymap.set
			local ui = require("harpoon.ui")
			local mark = require("harpoon.mark")

			set("n", "<leader>ha", ui.toggle_quick_menu, { desc = "Toggle Harpoon Quick Menu" })
			set("n", "<leader>hj", ui.nav_next, { desc = "Harpoon Next" })
			set("n", "<leader>hk", ui.nav_prev, { desc = "Harpoon Prev" })
			set("n", "<leader>hf", mark.add_file, { desc = "Harpoon Add File" })
			set("n", "<leader>h1", function()
				ui.nav_file(1)
			end, { desc = "Harpoon Go To File 1" })
			set("n", "<leader>h2", function()
				ui.nav_file(2)
			end, { desc = "Harpoon Go To File 2" })
			set("n", "<leader>h3", function()
				ui.nav_file(3)
			end, { desc = "Harpoon Go To File 3" })
			set("n", "<leader>h4", function()
				ui.nav_file(4)
			end, { desc = "Harpoon Go To File 4" })
			set("n", "<leader>h5", function()
				ui.nav_file(5)
			end, { desc = "Harpoon Go To File 5" })
			set("n", "<leader>h6", function()
				ui.nav_file(6)
			end, { desc = "Harpoon Go To File 6" })
			set("n", "<leader>h7", function()
				ui.nav_file(7)
			end, { desc = "Harpoon Go To File 7" })
			set("n", "<leader>h8", function()
				ui.nav_file(8)
			end, { desc = "Harpoon Go To File 8" })
			set("n", "<leader>h9", function()
				ui.nav_file(9)
			end, { desc = "Harpoon Go To File 9" })
		end,
	},
}
