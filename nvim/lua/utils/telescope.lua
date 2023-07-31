local ts_ok, builtin = pcall(require, "telescope.builtin")
if not ts_ok then
	return
end

local find_files_theme = require("telescope.themes").get_dropdown({
	winblend = 0,
	prompt = " ",
	previewer = false,
	layout_config = {
		width = 0.8,
		height = 0.6,
	},
})

local M = {}

function M.find_in_nvim_config()
	local opts = {
		prompt_title = "~ nvim dotfiles ~",
		shorten_path = false,
		cwd = "~/.config/nvim",
		follow = true,
	}
	builtin.find_files(vim.tbl_extend("force", find_files_theme, opts))
end

function M.find_in_zsh_config()
	local opts = {
		prompt_title = "~ zsh dotfiles ~",
		shorten_path = false,
		cwd = "~/.config/zsh",
		follow = true,
	}
	builtin.find_files(vim.tbl_extend("force", find_files_theme, opts))
end

function M.find_files()
	local opts = {
		hidden = true,
		no_ignore = true,
		file_ignore_patterns = {
			".git/",

			-- Node
			"node_modules",

			-- Python
			".venv",
			"__pycache__",
			"%.pyc",

			-- Java
			"%.class",
		},
	}
	builtin.find_files(vim.tbl_extend("force", find_files_theme, opts))
end

function M.git_files()
	builtin.git_files(find_files_theme)
end

function M.buffers()
	builtin.buffers({
		show_all_buffers = true,
		ignore_current_buffer = true,
		sort_lastused = true,
		sort_mru = true,
	})
end

return M
