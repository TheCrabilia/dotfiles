local w = require("wezterm")
local act = w.action

local sessionizer = require("sessionizer")
local workspace = require("workspace")

local M = {}

local function is_vim(pane)
	return pane:get_user_vars().IS_NVIM == "true"
end

local function split_nav(resize_or_move, key)
	local direction_keys = {
		h = "Left",
		j = "Down",
		k = "Up",
		l = "Right",
	}

	return {
		key = key,
		mods = resize_or_move == "resize" and "CTRL" or "META",
		action = w.action_callback(function(win, pane)
			if is_vim(pane) then
				-- pass the keys through to vim/nvim
				win:perform_action({
					SendKey = { key = key, mods = resize_or_move == "resize" and "CTRL" or "META" },
				}, pane)
			else
				if resize_or_move == "resize" then
					win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
				else
					win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
				end
			end
		end),
	}
end

function M.keys()
	local keys = {
		split_nav("move", "h"),
		split_nav("move", "j"),
		split_nav("move", "k"),
		split_nav("move", "l"),
		{ key = "h", mods = "CTRL|SHIFT", action = act.DisableDefaultAssignment },
		{ key = "k", mods = "CTRL|SHIFT", action = act.DisableDefaultAssignment },
		{ key = "k", mods = "CTRL|SHIFT", action = act.DisableDefaultAssignment },
		{ key = "l", mods = "CTRL|SHIFT", action = act.DisableDefaultAssignment },
		{ key = [["]], mods = "CTRL|SHIFT", action = act.ShowDebugOverlay },
		{ key = "[", mods = "LEADER", action = act.ActivateCopyMode },
		{ key = "c", mods = "LEADER", action = w.action({ SpawnTab = "CurrentPaneDomain" }) },
		{ key = "l", mods = "LEADER", action = act.ActivateLastTab },
		{
			key = "L",
			mods = "LEADER",
			action = w.action_callback(function(window, pane)
				workspace.switch_to_prev_workpace(window, pane)
			end),
		},
		{
			key = "%",
			mods = "LEADER",
			action = w.action({
				SplitHorizontal = { domain = "CurrentPaneDomain" },
			}),
		},
		{
			key = [["]],
			mods = "LEADER",
			action = w.action({
				SplitVertical = { domain = "CurrentPaneDomain" },
			}),
		},
		{
			key = ",",
			mods = "LEADER",
			action = w.action.PromptInputLine({
				description = "Enter new name for tab",
				action = w.action_callback(function(window, _, line)
					if line then
						window:active_tab():set_title(line)
					end
				end),
			}),
		},
		{
			key = "S",
			mods = "LEADER",
			action = act.PromptInputLine({
				description = "Enter new name for session",
				action = w.action_callback(function(window, pane, line)
					if line then
						workspace.switch_workspace(window, pane, {
							name = line,
							spawn = {
								cwd = os.getenv("HOME"),
							},
						})
					end
				end),
			}),
		},
		{
			key = "K",
			mods = "LEADER",
			action = w.action_callback(function(window, pane)
				workspace.kill_workspace(window, pane, window:active_workspace())
			end),
		},
		{
			key = "D",
			mods = "LEADER",
			action = w.action_callback(function(window, pane)
				workspace.switch_workspace(window, pane, {
					name = "dotfiles",
					spawn = {
						label = "dotfiles",
						cwd = w.home_dir .. "/.dotfiles",
					},
				})
			end),
		},
		{
			key = "f",
			mods = "LEADER",
			action = w.action_callback(function(window, pane)
				sessionizer.open(window, pane)
			end),
		},
		{
			key = "F",
			mods = "LEADER",
			action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }),
		},
	}

	for i = 1, 9 do
		table.insert(keys, {
			key = tostring(i),
			mods = "LEADER",
			action = act.ActivateTab(i - 1),
		})
	end

	return keys
end

return M
