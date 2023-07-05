local wezterm = require("wezterm")
local act = wezterm.action

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.front_end = "WebGpu"
config.disable_default_key_bindings = true
config.default_domain = "WSL:Ubuntu-20.04"
config.color_scheme = "Framer (base16)"
config.font = wezterm.font("Hasklug Nerd Font Mono", { weight = "Bold" })
config.font_size = 11.4

config.keys = {
	{ key = "P", mods = "CTRL|SHIFT", action = act.ActivateCommandPalette },
	{ key = "D", mods = "CTRL|SHIFT", action = act.ShowDebugOverlay },
	{ key = "L", mods = "CTRL|SHIFT", action = act.ShowLauncherArgs { flags = "LAUNCH_MENU_ITEMS"} },
	{ key = "-", mods = "CTRL", action = act.DecreaseFontSize },
	{ key = "=", mods = "CTRL", action = act.IncreaseFontSize },
	{ key = "|", mods = "ALT|SHIFT", action = act.SplitHorizontal },
	{ key = "%", mods = "ALT|SHIFT", action = act.SplitVertical },

	{ key = "LeftArrow", mods = "ALT|SHIFT", action = act.AdjustPaneSize({ "Left", 5 }) },
	{ key = "RightArrow", mods = "ALT|SHIFT", action = act.AdjustPaneSize({ "Right", 5 }) },
	{ key = "UpArrow", mods = "ALT|SHIFT", action = act.AdjustPaneSize({ "Up", 5 }) },
	{ key = "DownArrow", mods = "ALT|SHIFT", action = act.AdjustPaneSize({ "Down", 5 }) },
	{ key = "LeftArrow", mods = "CTRL", action = act.ActivatePaneDirection("Left") },
	{ key = "RightArrow", mods = "CTRL", action = act.ActivatePaneDirection("Right") },
	{ key = "UpArrow", mods = "CTRL", action = act.ActivatePaneDirection("Up") },
	{ key = "DownArrow", mods = "CTRL", action = act.ActivatePaneDirection("Down") },
	{ key = "PageDown", mods = "ALT", action = act.ActivateTabRelative(1) },
	{ key = "PageUp", mods = "ALT", action = act.ActivateTabRelative(-1) },
	{ key = "PageDown", mods = "ALT|SHIFT", action = act.MoveTabRelative(1) },
	{ key = "PageUp", mods = "ALT|SHIFT", action = act.MoveTabRelative(-1) },

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
}

for i = 1, 8 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "ALT",
		action = act.ActivateTab(i - 1),
	})
end

config.launch_menu = {
	{ label = "CAMMS Development", cwd = "~/workspace/method1/camms-portal" },
}

return config
