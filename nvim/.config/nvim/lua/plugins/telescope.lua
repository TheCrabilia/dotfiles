return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	cmd = "Telescope",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- "nvim-telescope/telescope-file-browser.nvim",
		"TheCrabilia/telescope-http.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
	opts = function()
		local actions = require("telescope.actions")
		local action_layout = require("telescope.actions.layout")
		local find_files_theme = require("telescope.themes").get_dropdown({
			winblend = 0,
			prompt = " ",
			previewer = false,
			layout_config = {
				width = 0.7,
				height = 0.5,
			},
		})
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
			pickers = {
				find_files = vim.tbl_extend("force", find_files_theme, {
					hidden = true,
					no_ignore = true,
					file_ignore_patterns = {
						"^.git/",

						-- Node
						"^node_modules/",
						"^.angular/",

						-- Python
						"^venv/",
						"^.venv/",
						"^__pycache__/",
						"^.pytest_cache/",
						"%.pyc",

						-- Java
						"%.class",

						-- Terraform
						"^.terraform/",
						".terraform.lock.hcl",

						-- Zsh
						"%.zwc",
						"%.zwc.old",
					},
				}),
				buffers = {
					show_all_buffers = true,
					ignore_current_buffer = true,
					sort_lastused = true,
					sort_mru = true,
				},
				live_grep = {
					additional_args = { "--hidden" },
				},
			},
			extensions_enable = { "fzf", "http" },
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
				file_browser = {
					theme = "dropdown",
					hijack_netrw = true,
					previewer = false,
					hidden = {
						file_browser = true,
						folder_browser = true,
					},
					layout_config = {
						width = 0.7,
						height = 0.5,
					},
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
	keys = function()
		-- local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		return {
			-- {
			-- 	"<leader>e",
			-- 	mode = "n",
			-- 	function()
			-- 		telescope.extensions.file_browser.file_browser({
			-- 			path = "%:p:h",
			-- 			respect_gitignore = false,
			-- 		})
			-- 	end,
			-- 	desc = "File Browser",
			-- },
			{
				"<leader>ff",
				mode = "n",
				function()
					builtin.find_files()
				end,
				desc = "Find Files",
			},
			{
				"<leader>fl",
				mode = "n",
				function()
					builtin.live_grep()
				end,
				desc = "Live Grep",
			},
			{
				"<leader>fh",
				mode = "n",
				function()
					builtin.help_tags()
				end,
				desc = "Help Tags",
			},
			{
				"<leader>fb",
				mode = "n",
				function()
					builtin.buffers()
				end,
				desc = "Buffers",
			},
			{
				"<leader>ft",
				mode = "n",
				function()
					builtin.treesitter()
				end,
				desc = "Buffer symbols",
			},
			{
				"<leader>fd",
				mode = "n",
				function()
					builtin.diagnostics()
				end,
				desc = "Workspace Diagnostics",
			},
			{
				"<leader>gb",
				mode = "n",
				function()
					builtin.git_branches()
				end,
				desc = "Git Branches",
			},
		}
	end,
}
