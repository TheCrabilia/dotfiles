---@type LazySpec
return {
	"ThePrimeagen/harpoon",
	opts = function()
		return {
			menu = {
				width = math.floor(vim.api.nvim_win_get_width(0) * 0.6),
			},
		}
	end,
	keys = {
		{
			"<leader>ha",
			mode = "n",
			function()
				require("harpoon.ui").toggle_quick_menu()
			end,
			desc = "Toggle Quick Menu",
		},
		{
			"<leader>hj",
			mode = "n",
			function()
				require("harpoon.ui").nav_next()
			end,
			desc = "Next File",
		},
		{
			"<leader>hk",
			mode = "n",
			function()
				require("harpoon.ui").nav_prev()
			end,
			desc = "Prev File",
		},
		{
			"<leader>hf",
			mode = "n",
			function()
				require("harpoon.mark").add_file()
			end,
			desc = "Add File",
		},
		{
			"<leader>h1",
			mode = "n",
			function()
				require("harpoon.ui").nav_file(1)
			end,
			desc = "Go To File 1",
		},
		{
			"<leader>h2",
			mode = "n",
			function()
				require("harpoon.ui").nav_file(2)
			end,
			desc = "Go To File 2",
		},
		{
			"<leader>h3",
			mode = "n",
			function()
				require("harpoon.ui").nav_file(3)
			end,
			desc = "Go To File 3",
		},
		{
			"<leader>h4",
			mode = "n",
			function()
				require("harpoon.ui").nav_file(4)
			end,
			desc = "Go To File 4",
		},
		{
			"<leader>h5",
			mode = "n",
			function()
				require("harpoon.ui").nav_file(5)
			end,
			desc = "Go To File 5",
		},
		{
			"<leader>h6",
			mode = "n",
			function()
				require("harpoon.ui").nav_file(6)
			end,
			desc = "Go To File 6",
		},
		{
			"<leader>h7",
			mode = "n",
			function()
				require("harpoon.ui").nav_file(7)
			end,
			desc = "Go To File 7",
		},
		{
			"<leader>h8",
			mode = "n",
			function()
				require("harpoon.ui").nav_file(8)
			end,
			desc = "Go To File 8",
		},
		{
			"<leader>h9",
			mode = "n",
			function()
				require("harpoon.ui").nav_file(9)
			end,
			desc = "Go To File 9",
		},
	},
}
