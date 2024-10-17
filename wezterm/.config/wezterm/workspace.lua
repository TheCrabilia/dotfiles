local w = require("wezterm")
local act = w.action

local util = require("util")

local M = {}

function M.kill_workspace(window, pane, workspace)
	local success, stdout = w.run_child_process({
		"/opt/homebrew/bin/wezterm",
		"cli",
		"list",
		"--format=json",
	})

	if success then
		local json = w.json_parse(stdout)
		if not json then
			return
		end

		local workspace_panes = util.filter(json, function(v)
			return v.workspace == workspace
		end)

		M.switch_to_prev_workpace(window, pane)
		w.GLOBAL.prev_workspace = nil

		for _, p in ipairs(workspace_panes) do
			w.run_child_process({
				"/opt/homebrew/bin/wezterm",
				"cli",
				"kill-pane",
				"--pane-id=" .. p.pane_id,
			})
		end
	end
end

function M.switch_workspace(window, pane, opts)
	opts = opts or {}

	if opts.name == nil then
		w.log_error("Workspace name must be set")
		return
	end

	local current_workspace = window:active_workspace()
	if opts.name == current_workspace then
		return
	end

	window:perform_action(act.SwitchToWorkspace(opts), pane)
	w.GLOBAL.prev_workspace = current_workspace
end

function M.switch_to_prev_workpace(window, pane)
	local current_workspace = window:active_workspace()
	local workspace = w.GLOBAL.prev_workspace

	if current_workspace == workspace or workspace == nil then
		return
	end

	M.switch_workspace(window, pane, { name = workspace })
end

function M.find_workspace(window, pane)
	local workspace = window:active_workspace()
	window:perform_action(act.ShowLauncherArgs({ flags = "WORKSPACES|FUZZY" }), pane)

	if workspace ~= window:active_workspace() then
		w.GLOBAL.prev_workspace = workspace
	end
end

return M
