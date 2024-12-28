local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local action_state = require("telescope.actions.state")
local actions = require("telescope.actions")

local M = {}

local function oil_open(prompt_bufnr)
	local selection = action_state.get_selected_entry()
	local dir = selection[1]
	actions.close(prompt_bufnr)
	vim.cmd.Oil(dir)
end

function M.find_directories(opts)
	opts = opts or {}
	opts.cwd = opts.cwd or vim.uv.cwd()
	opts.previewer = false

	local find_command = {
		"fd",
		"--type",
		"d",
		"--color",
		"never",
		"--ignore-case",
		"--hidden",
	}

	local ignore_patterns = {
		".git",
		"node_modules",
		"vendor",
	}

	for _, pattern in ipairs(ignore_patterns) do
		find_command[#find_command + 1] = "-E"
		find_command[#find_command + 1] = pattern
	end

	pickers
		.new(opts, {
			debounce = 100,
			prompt_title = "Find Directories",
			finder = finders.new_oneshot_job(find_command, opts),
			previewer = conf.grep_previewer(opts),
			sorter = conf.file_sorter(opts),
			attach_mappings = function()
				actions.select_default:replace(oil_open)
				return true
			end,
		})
		:find()
end

return M
