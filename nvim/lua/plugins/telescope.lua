return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
			{ "nvim-telescope/telescope-file-browser.nvim" },
			{ "nvim-telescope/telescope-project.nvim" },
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
				extensions_enable = { "fzf", "file_browser", "project" },
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
					file_browser = {
						theme = "ivy",
						hijack_netrw = true,
					},
				},
			}
		end,
		config = function(_, opts)
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")
			local utils = require("utils.telescope")
			local set = vim.keymap.set

			telescope.setup(opts)

			for _, ext in pairs(opts.extensions_enable) do
				require("telescope").load_extension(ext)
			end

			set("n", "<leader>e", function()
				telescope.extensions.file_browser.file_browser({ path = "%:p:h", respect_gitignore = false })
			end, { desc = "File Browser" })
			set("n", "<leader>ff", function()
				utils.find_files()
			end, { desc = "Find Files" })
			set("n", "<leader>fg", function()
				builtin.git_files()
			end, { desc = "Find Files" })
			set("n", "<leader>fo", function()
				builtin.oldfiles()
			end, { desc = "Old Files" })
			set("n", "<leader>fl", function()
				builtin.live_grep()
			end, { desc = "Live Grep" })
			set("n", "<leader>fh", function()
				builtin.help_tags()
			end, { desc = "Help Tags" })
			set("n", "<leader>fk", function()
				builtin.keymaps()
			end, { desc = "Keymaps" })
			set("n", "<leader>fp", function()
				telescope.extensions.project.project({ display_type = "full" })
			end, { desc = "List Projects" })
			set("n", "<leader>fdn", function()
				utils.edit_nvim()
			end, { desc = "Search nvim config files" })
			set("n", "<leader>fdz", function()
				utils.edit_zsh()
			end, { desc = "Search zsh config files" })
		end,
	},
}
