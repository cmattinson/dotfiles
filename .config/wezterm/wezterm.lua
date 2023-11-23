local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.front_end = "WebGpu"
config.disable_default_key_bindings = true
config.color_scheme = "Hurtado"
config.font = wezterm.font("Hasklug Nerd Font Mono", { weight = "Medium" })
config.font_size = 20
config.tab_bar_at_bottom = true

config.keys = {
	{ key = "P", mods = "CTRL|SHIFT", action = act.ActivateCommandPalette },
	{ key = "D", mods = "CTRL|SHIFT", action = act.ShowDebugOverlay },
	{ key = "L", mods = "CTRL|SHIFT", action = act.ShowLauncher },
	{ key = "-", mods = "CTRL", action = act.DecreaseFontSize },
	{ key = "=", mods = "CTRL", action = act.IncreaseFontSize },
	{ key = "|", mods = "CMD|SHIFT", action = act.SplitHorizontal },
	{ key = "-", mods = "CMD|SHIFT", action = act.SplitVertical },
	{ key = "t", mods = "CTRL", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "LeftArrow", mods = "CMD|SHIFT", action = act.AdjustPaneSize({ "Left", 5 }) },
	{ key = "RightArrow", mods = "CMD|SHIFT", action = act.AdjustPaneSize({ "Right", 5 }) },
	{ key = "UpArrow", mods = "CMD|SHIFT", action = act.AdjustPaneSize({ "Up", 5 }) },
	{ key = "DownArrow", mods = "CMD|SHIFT", action = act.AdjustPaneSize({ "Down", 5 }) },
	{ key = "LeftArrow", mods = "CMD", action = act.ActivatePaneDirection("Left") },
	{ key = "RightArrow", mods = "CMD", action = act.ActivatePaneDirection("Right") },
	{ key = "UpArrow", mods = "CMD", action = act.ActivatePaneDirection("Up") },
	{ key = "DownArrow", mods = "CMD", action = act.ActivatePaneDirection("Down") },
	{ key = "PageDown", mods = "CMD", action = act.ActivateTabRelative(1) },
	{ key = "PageUp", mods = "CMD", action = act.ActivateTabRelative(-1) },
	{ key = "PageDown", mods = "CMD|SHIFT", action = act.MoveTabRelative(1) },
	{ key = "PageUp", mods = "CMD|SHIFT", action = act.MoveTabRelative(-1) },
	{ key = "F", mods = "CTRL|SHIFT", action = act.ToggleFullScreen },
	{ key = "v", mods = "CTRL", action = act.PasteFrom("Clipboard") },
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
	{ key = "h", mods = "CMD", action = act.HideApplication },
}

for i = 1, 8 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "CMD",
		action = act.ActivateTab(i - 1),
	})
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local pane = tab.active_pane
	local title = basename(pane.foreground_process_name) .. " " .. pane.pane_id
	wezterm.log_info(pane.foreground_process_name)
	return {
		{ Text = pane.domain_name .. " " },
	}
end)

return config
