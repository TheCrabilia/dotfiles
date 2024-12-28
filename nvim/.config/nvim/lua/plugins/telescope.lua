---@type LazySpec
return {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"TheCrabilia/telescope-http.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
	},
	opts = function()
		local actions = require("telescope.actions")
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
			pickers = {
				find_files = vim.tbl_extend("force", find_files_theme, {
					hidden = true,
					no_ignore = false,
					file_ignore_patterns = {
						"^.git/",

						-- Golang
						".?vendor/",
						"go%.sum",

						-- Node
						"node_modules/",
						"%.angular/",
						"dist/",

						-- Python
						"venv/",
						"%.venv/",
						"__pycache__/",
						"%.pytest_cache/",
						"%.ruff_cache/",
						"%.pyc",

						-- Terraform
						"%.terraform/",
						"%.terraform%.lock%.hcl",
						"%.terragrunt.cache/",

						-- Java
						"%.class",

						-- Zsh
						"%.zwc",
						"%.zwc%.old",

						-- Editors
						"%.vscode/",
					},
					mappings = {
						i = {
							["<C-u>"] = false,
						},
					},
				}),
				buffers = {
					show_all_buffers = true,
					ignore_current_buffer = true,
					sort_lastused = true,
					sort_mru = true,
					mappings = {
						i = {
							["<C-d>"] = actions.delete_buffer + actions.move_to_top,
						},
					},
				},
				live_grep = {
					additional_args = { "--hidden", "-g=!{.git,node_modules,vendor}" },
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
		return {
			{
				"<leader>ff",
				mode = "n",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Find Files",
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
				"<leader>fb",
				mode = "n",
				function()
					require("telescope.builtin").buffers()
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
				"<leader>/",
				mode = "n",
				function()
					require("telescope.builtin").current_buffer_fuzzy_find()
				end,
				desc = "Current Buffer Fuzzy Find",
			},
			{
				"<leader>fd",
				mode = "n",
				function()
					require("core.telescope").find_directories()
				end,
				desc = "Find Directories",
			},
		}
	end,
}
