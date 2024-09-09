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
			"<leader>hf",
			mode = "n",
			function()
				require("harpoon"):list():add()
			end,
			desc = "Add File",
		},
		{
			"<leader><leader>h",
			mode = "n",
			function()
				require("harpoon"):list():select(1)
			end,
		},
		{
			"<leader><leader>j",
			mode = "n",
			function()
				require("harpoon"):list():select(2)
			end,
		},
		{
			"<leader><leader>k",
			mode = "n",
			function()
				require("harpoon"):list():select(3)
			end,
		},
		{
			"<leader><leader>l",
			mode = "n",
			function()
				require("harpoon"):list():select(4)
			end,
		},
	},
}
