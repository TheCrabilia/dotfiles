local w = require("wezterm")
local M = {}

function M.open(window, pane)
	local projects = {}
	local home = os.getenv("HOME")
	local strip_prefix = home .. "/Documents/"

	local success, stdout, stderr = w.run_child_process({
		"/opt/homebrew/bin/fd",
		".",
		"--max-depth=2",
		"--type=d",
		os.getenv("HOME") .. "/Documents",
	})

	if not success then
		w.log_error("Failed to run fd: " .. stderr)
		return
	end

	-- define variables from from file paths extractions and
	-- fill table with results
	for line in stdout:gmatch("([^\n]*)\n?") do
		w.log_info(line)

		local project = line:gsub("/$", "")
		local label = project:gsub(strip_prefix, "")
		local _, _, id = string.find(project, ".*/(.+)")

		table.insert(projects, { label = tostring(label), id = tostring(id) })
	end

	w.GLOBAL.prev_workspace = window:active_workspace()
	window:perform_action(
		w.action.InputSelector({
			action = w.action_callback(function(win, _, id, label)
				if not id and not label then
					w.log_info("Cancelled")
				else
					w.log_info("Selected " .. label)
					win:perform_action(
						w.action.SwitchToWorkspace({
							name = id,
							spawn = { cwd = strip_prefix .. label },
						}),
						pane
					)
				end
			end),
			fuzzy = true,
			title = "Select project",
			choices = projects,
		}),
		pane
	)
end

return M
