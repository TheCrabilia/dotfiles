return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.2",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-project.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
	opts = function()
		local actions = require("telescope.actions")
		local action_layout = require("telescope.actions.layout")
		return {
			defaults = {
				mappings = {
					i = {
						["<esc>"] = actions.close,
						["<C-u>"] = false,
						["<M-p>"] = action_layout.toggle_preview,
					},
					n = {
						["<M-p>"] = action_layout.toggle_preview,
					},
				},
			},
			extensions_enable = { "fzf", "project" },
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		}
	end,
	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)

		for _, ext in pairs(opts.extensions_enable) do
			telescope.load_extension(ext)
		end
	end,
	keys = {
		{
			"<leader>ff",
			mode = "n",
			function()
				require("utils.telescope").find_files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>fg",
			mode = "n",
			function()
				require("utils.telescope").git_files()
			end,
			desc = "Find Git Files",
		},
		{
			"<leader>fl",
			mode = "n",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Live Grep",
		},
		{
			"<leader>fh",
			mode = "n",
			function()
				require("telescope.builtin").help_tags()
			end,
			desc = "Help Tags",
		},
		{
			"<leader>fk",
			mode = "n",
			function()
				require("telescope.builtin").keymaps()
			end,
			desc = "Keymaps",
		},
		{
			"<leader>fb",
			mode = "n",
			function()
				require("utils.telescope").buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>ft",
			mode = "n",
			function()
				require("telescope.builtin").treesitter()
			end,
			desc = "Buffer symbols",
		},
		{
			"<leader>gb",
			mode = "n",
			function()
				require("telescope.builtin").git_branches()
			end,
			desc = "Git Branches",
		},
		{
			"<leader>fp",
			mode = "n",
			function()
				require("telescope").extensions.project.project({ display_type = "full" })
			end,
			desc = "List Projects",
		},
		{
			"<leader>fdn",
			mode = "n",
			function()
				require("utils.telescope").find_in_nvim_config()
			end,
			desc = "Search nvim config files",
		},
		{
			"<leader>fdz",
			mode = "n",
			function()
				require("utils.telescope").find_in_zsh_config()
			end,
			desc = "Search zsh config files",
		},
	},
}
