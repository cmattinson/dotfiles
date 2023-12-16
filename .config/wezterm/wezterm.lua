local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

local config = {}

local BACKGROUND_COLOR = "#0F0F0F"

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.front_end = "WebGpu"
config.disable_default_key_bindings = true
config.color_scheme = "N0tch2k (Gogh)"

config.window_background_gradient = {
	colors = {
		BACKGROUND_COLOR,
	},
}

config.font = wezterm.font("Hasklug Nerd Font", { weight = "Medium" })
config.font_size = 21

config.keys = {
	{ key = "-", mods = "CMD|SHIFT", action = act.SplitVertical },
	{ key = "-", mods = "CTRL", action = act.DecreaseFontSize },
	{ key = "=", mods = "CTRL", action = act.IncreaseFontSize },
	{ key = "D", mods = "CTRL|SHIFT", action = act.ShowDebugOverlay },
	{ key = "DownArrow", mods = "CMD", action = act.ActivatePaneDirection("Down") },
	{ key = "DownArrow", mods = "CMD|SHIFT", action = act.AdjustPaneSize({ "Down", 5 }) },
	{ key = "L", mods = "CTRL|SHIFT", action = wezterm.action.EmitEvent("toggle-ligature") },
	{ key = "F", mods = "CTRL|SHIFT", action = act.ToggleFullScreen },
	-- { key = "L", mods = "CTRL|SHIFT", action = act.ShowLauncher },
	{ key = "LeftArrow", mods = "CMD", action = act.ActivatePaneDirection("Left") },
	{ key = "LeftArrow", mods = "CMD|SHIFT", action = act.AdjustPaneSize({ "Left", 5 }) },
	{ key = "P", mods = "CTRL|SHIFT", action = act.ActivateCommandPalette },
	{ key = "PageDown", mods = "CMD", action = act.ActivateTabRelative(1) },
	{ key = "PageDown", mods = "CMD|SHIFT", action = act.MoveTabRelative(1) },
	{ key = "PageUp", mods = "CMD", action = act.ActivateTabRelative(-1) },
	{ key = "PageUp", mods = "CMD|SHIFT", action = act.MoveTabRelative(-1) },
	{
		key = "R",
		mods = "CTRL|SHIFT",
		action = act.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	{ key = "RightArrow", mods = "CMD", action = act.ActivatePaneDirection("Right") },
	{ key = "RightArrow", mods = "CMD|SHIFT", action = act.AdjustPaneSize({ "Right", 5 }) },
	{ key = "UpArrow", mods = "CMD", action = act.ActivatePaneDirection("Up") },
	{ key = "UpArrow", mods = "CMD|SHIFT", action = act.AdjustPaneSize({ "Up", 5 }) },
	{ key = "h", mods = "CMD", action = act.HideApplication },
	{ key = "t", mods = "CTRL", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "v", mods = "CTRL", action = act.PasteFrom("Clipboard") },
	{ key = "|", mods = "CMD|SHIFT", action = act.SplitHorizontal },
}

for i = 1, 8 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "CMD",
		action = act.ActivateTab(i - 1),
	})
end

wezterm.on("toggle-ligature", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if not overrides.harfbuzz_features then
		-- If we haven't overridden it yet, then override with ligatures disabled
		overrides.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
	else
		-- else we did already, and we should disable out override now
		overrides.harfbuzz_features = nil
	end
	window:set_config_overrides(overrides)
end)

local function get_current_working_dir(tab)
	local current_dir = tab.active_pane.current_working_dir
	local HOME_DIR = string.format("file://%s", os.getenv("HOME"))

	return current_dir == HOME_DIR and "." or string.gsub(current_dir, "(.*[/\\])(.*)", "%2")
end

config.window_decorations = "RESIZE"
config.window_frame = {
	active_titlebar_bg = BACKGROUND_COLOR,
}
config.colors = {
	tab_bar = {
		inactive_tab_edge = BACKGROUND_COLOR,
		active_tab = {
			bg_color = BACKGROUND_COLOR,
			fg_color = "#f6c177",
		},
		inactive_tab = {
			bg_color = BACKGROUND_COLOR,
			fg_color = "#908caa",
		},
		new_tab = {
			bg_color = BACKGROUND_COLOR,
			fg_color = BACKGROUND_COLOR,
		},
	},
	cursor_bg = "#848484",
}

config.tab_bar_at_bottom = true
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local pane = tab.active_pane
	local title = basename(pane.foreground_process_name) .. " " .. pane.pane_id
	local title = string.format(" %s  %s ~ %s  ", "❯", get_current_working_dir(tab))
	wezterm.log_info(pane.foreground_process_name)
	return {
		{ Text = title },
	}
end)

return config
