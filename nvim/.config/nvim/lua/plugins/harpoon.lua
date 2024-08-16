---@type LazySpec
return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	config = function()
		require("harpoon"):setup()
	end,
	keys = {
		{
			"<leader>ha",
			mode = "n",
			function()
				local harpoon = require("harpoon")
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end,
			desc = "Toggle Quick Menu",
		},
		{
			"<C-k>",
			mode = "n",
			function()
				require("harpoon"):list():next()
			end,
			desc = "Harpoon Next File",
		},
		{
			"<C-j>",
			mode = "n",
			function()
				require("harpoon"):list():prev()
			end,
			desc = "Harpoon Prev File",
		},
		{
			"<leader>hf",
			mode = "n",
			function()
				require("harpoon"):list():add()
			end,
			desc = "Add File",
		},
		{
			"<C-S-h>",
			mode = "n",
			function()
				require("harpoon"):list():select(1)
			end,
		},
		{
			"<C-S-j>",
			mode = "n",
			function()
				require("harpoon"):list():select(2)
			end,
		},
		{
			"<C-S-k>",
			mode = "n",
			function()
				require("harpoon"):list():select(3)
			end,
		},
		{
			"<C-S-l>",
			mode = "n",
			function()
				require("harpoon"):list():select(4)
			end,
		},
	},
}
