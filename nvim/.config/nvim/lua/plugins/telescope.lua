---@type LazySpec
return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	-- branch = "0.1.x",
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
			pickers = {
				find_files = vim.tbl_extend("force", find_files_theme, {
					hidden = true,
					no_ignore = false,
					file_ignore_patterns = {
						"^.git/",

						-- Node
						"^node_modules/",
						"^%.angular/",

						-- Python
						"^venv/",
						"^%.venv/",
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
			{
				"<leader>/",
				mode = "n",
				function()
					builtin.current_buffer_fuzzy_find()
				end,
				desc = "Current Buffer Fuzzy Find",
			},
		}
	end,
}
