local wezterm = require("wezterm")
local keybinds = require("keybinds")

local config = wezterm.config_builder()

config.font = wezterm.font("JetBrainsMono Nerd Font Mono", { weight = "Bold" })
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0", "zero" } -- Disable ligatures
config.font_size = 13.5
config.colors = { foreground = "#c5c8c6", background = "#1d1f21" }
config.inactive_pane_hsb = { saturation = 1, brightness = 1 }
config.force_reverse_video_cursor = true
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

wezterm.on("update-status", function(window)
	window:set_left_status(" " .. window:active_workspace() .. " ")
end)

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = keybinds.keys()

return config
