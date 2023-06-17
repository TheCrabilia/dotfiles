return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.2",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
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

      -- stylua: ignore start
		set("n", "<leader>e", function() telescope.extensions.file_browser.file_browser({ path = "%:p:h", respect_gitignore = false }) end, { desc = "File Browser" })
		set("n", "<leader>ff", utils.find_files, { desc = "Find Files" })
		set("n", "<leader>fg", utils.git_files, { desc = "Find Files" })
		set("n", "<leader>fo", builtin.oldfiles, { desc = "Old Files" })
		set("n", "<leader>fl", builtin.live_grep, { desc = "Live Grep" })
		set("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
		set("n", "<leader>fk", builtin.keymaps, { desc = "Keymaps" })
		set("n", "<leader>fb", utils.buffers, { desc = "Buffers" })
		set("n", "<leader>ft", builtin.treesitter, { desc = "Buffer symbols" })
		set("n", "<leader>gb", builtin.git_branches, { desc = "Branches" })
		set("n", "<leader>fp", function() telescope.extensions.project.project({ display_type = "full" }) end, { desc = "List Projects" })
		set("n", "<leader>fdn", utils.find_in_nvim_config, { desc = "Search nvim config files" })
		set("n", "<leader>fdz", utils.find_in_zsh_config, { desc = "Search zsh config files" })
		-- stylua: ignore end
	end,
}
