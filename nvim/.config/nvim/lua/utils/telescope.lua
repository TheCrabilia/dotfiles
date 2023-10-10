local ts_ok, builtin = pcall(require, "telescope.builtin")
if not ts_ok then
	return
end

local find_files_theme = require("telescope.themes").get_dropdown({
	winblend = 0,
	prompt = " ",
	previewer = false,
	layout_config = {
		width = 0.7,
		height = 0.5,
	},
})

local M = {}

function M.find_files()
	local opts = {
		hidden = true,
		no_ignore = true,
		file_ignore_patterns = {
			".git",

			-- Node
			"node_modules",
			".angular",

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
