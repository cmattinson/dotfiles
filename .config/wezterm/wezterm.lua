local wezterm = require("wezterm")
local act = wezterm.action
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "MaterialOcean"
local BACKGROUND_COLORS = {
	Black = "#000000",
	White = "#FFFFFF",
	Rocket = "#161616",
	RosePine = "#191724",
	Material = "#111219",
}

local BACKGROUND_COLOR = BACKGROUND_COLORS.Black

config.window_frame = {
	active_titlebar_bg = BACKGROUND_COLOR,
	active_titlebar_fg = "white",
	inactive_titlebar_bg = BACKGROUND_COLOR,
}

config.colors = {
	tab_bar = {
		inactive_tab_edge = BACKGROUND_COLOR,
		active_tab = {
			bg_color = BACKGROUND_COLOR,
			fg_color = "#dadada",
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
}

local FONT_WEIGHTS = {
	Thin = "Thin",
	ExtraLight = "ExtraLight",
	Light = "Light",
	DemiLight = "DemiLight",
	Book = "Book",
	Regular = "Regular",
	Medium = "Medium",
	DemiBold = "DemiBold",
	Bold = "Bold",
	ExtraBold = "ExtraBold",
	Black = "Black",
	ExtraBlack = "ExtraBlack",
}

local HARFBUZZ = {
	Cove = { "ss01", "ss02", "ss19" },
	Commit = { "ss01", "ss02", "ss04", "cv02", "cv06", "cv10", "cv11" },
	Fira = {
		"cv04",
		"cv09",
		"cv14",
		"ss01",
		"ss02",
		"ss03",
		"ss08",
	},
	Fragment = { "ss02", "ss03", "ss04" },
	Geist = { "ss01", "ss03", "ss04", "ss08" },
	iA = { "ss03" },
	Julia = { "ss01", "ss04", "cv04" },
	Monaspace = { "zero", "liga", "calt", "ss03", "ss05", "ss06", "ss07", "ss08", "ss09" },
	Lilex = {
		"calt",
		"cv03",
		"cv08",
		"cv11",
		"ss02",
		"ss04",
		"zero",
	},
	Twilio = { "calt=0", "ss05" },
}

local FONTS = {
	Cove = "CaskaydiaCove Nerd Font",
	Fira = "FiraCode Nerd Font",
	Fragment = "Fragment Mono",
	Geist = "GeistMono Nerd Font",
	Hack = "Hack Nerd Font",
	Hasklug = "Hasklug Nerd Font",
	iA = "iA Writer Mono S",
	Julia = "JuliaMono",
	Lilex = "Lilex Nerd Font",
	Proggy = "ProggyVector",
	Terminess = "Terminess Nerd Font",
	Twilio = "Twilio Sans Mono",
	Roboto = "RobotoMono Nerd Font",
}

local FONT = {
	family = FONTS.Proggy,
	italic = false,
	weight = FONT_WEIGHTS.Regular,
}

config.font = wezterm.font(FONT)
config.font_size = 15
config.font_rules = {
	{
		intensity = "Half",
		font = wezterm.font(FONT),
	},
	{
		italic = true,
		font = wezterm.font(FONT),
	},
}

config.front_end = "WebGpu"
config.disable_default_key_bindings = true

config.window_background_gradient = {
	orientation = "Vertical",
	colors = {
		BACKGROUND_COLOR,
	},
}

config.keys = {
	{ key = "-", mods = "CMD|SHIFT", action = act.SplitVertical },
	{ key = "-", mods = "CTRL", action = act.DecreaseFontSize },
	{ key = "=", mods = "CTRL", action = act.IncreaseFontSize },
	{ key = "D", mods = "CTRL|SHIFT", action = act.ShowDebugOverlay },
	{ key = "DownArrow", mods = "CMD", action = act.ActivatePaneDirection("Down") },
	{ key = "DownArrow", mods = "CMD|SHIFT", action = act.AdjustPaneSize({ "Down", 5 }) },
	{ key = "L", mods = "CTRL|SHIFT", action = wezterm.action.EmitEvent("toggle-ligature") },
	{ key = "F", mods = "CTRL|SHIFT", action = act.ToggleFullScreen },
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

local function get_current_working_dir(tab)
	local current_dir = tab.active_pane.current_working_dir
	local HOME_DIR = string.format("file://%s", os.getenv("HOME"))

	return current_dir == HOME_DIR and "." or string.gsub(current_dir, "(.*[/\\])(.*)", "%2")
end

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
