local wezterm = require("wezterm")
local keybinds = require("keybinds")

local config = wezterm.config_builder()

config.font = wezterm.font("JetBrainsMonoNL Nerd Font Mono", { weight = "Regular" })
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0", "zero" } -- Disable ligatures
config.font_size = 15
config.color_scheme = "Catppuccin Mocha"
config.inactive_pane_hsb = { saturation = 1, brightness = 1 }
config.force_reverse_video_cursor = true
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.audible_bell = "Disabled"
config.max_fps = 144

wezterm.on("update-status", function(window)
	window:set_left_status(" " .. window:active_workspace() .. " ")
end)

wezterm.on("format-window-title", function()
	return "WezTerm"
end)

-- wezterm.on("format-tab-title", function(tab)
-- 	local zoomed = ""
-- 	if tab.active_pane.is_zoomed then
-- 		zoomed = "*Z"
-- 	end
--
-- 	return " " .. tab.tab_id .. ": " .. tab.active_pane.title .. zoomed .. " "
-- end)

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = keybinds.keys()

return config
