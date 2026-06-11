local wezterm = require("wezterm")
local act = wezterm.action
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

local BACKGROUND_COLORS = {
	Ayu = "#0B0E14",
	Black = "#000000",
	Blue = "#151825",
	Catppuccin = "#24273a",
	Dark = "#0F1115",
	Everforest = "#2d353b",
	GitHub = "#0d1117",
	Kanagawa = "#1f1f28",
	Kintsugi = "#161618",
	LucentOrng = "#2a1a15",
	Material = "#111219",
	Macchiato = "#1e1e2e",
	Mocha = "#1E1E2E",
	Oasis = "#11151c",
	Rocket = "#161616",
	RosePine = "#191724",
	Soft = "#22273D",
	TokyoNight = "#1a1b26",
	Vesper = "#1a1a2e",
	White = "#F2F0EF",
}

local BACKGROUND_COLOR = BACKGROUND_COLORS.Ayu

-- local catpuccin_theme = function()
-- 	config.color_scheme = "Ayu Dark (Gogh)"
-- 	config.window_frame = {
-- 		active_titlebar_bg = BACKGROUND_COLOR,
-- 		active_titlebar_fg = "white",
-- 		inactive_titlebar_bg = BACKGROUND_COLOR,
-- 	}
-- 	config.colors = {
-- 		tab_bar = {
-- 			inactive_tab_edge = BACKGROUND_COLOR,
-- 			active_tab = {
-- 				bg_color = BACKGROUND_COLOR,
-- 				fg_color = "white",
-- 			},
-- 			inactive_tab = {
-- 				bg_color = BACKGROUND_COLOR,
-- 				fg_color = "lightgray",
-- 			},
-- 			new_tab = {
-- 				bg_color = BACKGROUND_COLOR,
-- 				fg_color = BACKGROUND_COLOR,
-- 			},
-- 		},
-- 	}
-- end

local material_ocean_scheme = function()
	config.color_scheme = "Ayu Dark (Gogh)"
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
end

config.color_scheme_dirs = { os.getenv("HOME") .. "/.config/wezterm/colors" }

material_ocean_scheme()

config.inactive_pane_hsb = {
	saturation = 1.0,
	brightness = 1.0,
}

config.window_background_gradient = {
	orientation = "Vertical",
	colors = {
		BACKGROUND_COLOR,
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

local FONT_STRETCH = {
	UltraCondensed = "UltraCondensed",
	ExtraCondensed = "ExtraCondensed",
	Condensed = "Condensed",
	SemiCondensed = "SemiCondensed",
	Normal = "Normal",
	SemiExpanded = "SemiExpanded",
	Expanded = "Expanded",
	ExtraExpanded = "ExtraExpanded",
	UltraExpanded = "UltraExpanded",
}

local FONTS = {
	Argon = {
		config = {
			family = "Monaspace Argon",
			weight = FONT_WEIGHTS.Regular,
			harfbuzz_features = {
				"'cv01' 2",
				"ss03",
				"ss07",
				"calt",
				"cv10",
				"cv11",
			},
		},
		opts = {
			line_height = 1.3,
			font_size = 16,
		},
	},
	Berk = {
		config = {
			family = "Berkeley Mono Trial",
			weight = FONT_WEIGHTS.Regular,
		},
		opts = {
			line_height = 1.4,
			font_size = 17,
		},
	},
	Fira = {
		config = {
			family = "FiraMono Nerd Font",
			italic = false,
			weight = FONT_WEIGHTS.Regular,
			harfbuzz_features = {
				"zero",
			},
		},
		opts = {
			line_height = 1.3,
			font_size = 17,
		},
	},
	Iosevka = {
		config = {
			family = "Iosevka Berkeley",
			weight = FONT_WEIGHTS.Regular,
			stretch = FONT_STRETCH.Normal,
		},
		opts = {
			line_height = 1.3,
			font_size = 17,
		},
	},
	Menlo = {
		config = {
			family = "Menlo",
			weight = FONT_WEIGHTS.Regular,
		},
		opts = {
			line_height = 1.3,
			font_size = 18,
		},
	},
	Neon = {
		config = {
			family = "Monaspace Neon",
			weight = FONT_WEIGHTS.Regular,
			harfbuzz_features = {
				"'cv01' 2",
				"ss03",
				"ss07",
				"calt",
			},
		},
		opts = {
			line_height = 1.3,
			font_size = 17,
		},
	},
	Proggy = {
		config = {
			family = "ProggyVector",
			weight = FONT_WEIGHTS.Regular,
		},
		opts = {
			line_height = 1.1,
			font_size = 17,
		},
	},
	Roboto = {
		config = {
			family = "RobotoMono Nerd Font",
			weight = FONT_WEIGHTS.Regular,
		},
		opts = {
			line_height = 1.2,
			font_size = 17,
		},
	},
	Sauce = {
		config = {
			family = "SauceCodePro Nerd Font",
			weight = FONT_WEIGHTS.Regular,
			harfbuzz_features = {
				"zero",
			},
		},
		opts = {
			line_height = 1.2,
			font_size = 19,
		},
	},
	SF = {
		config = {
			family = "SFMono Nerd Font",
			weight = FONT_WEIGHTS.Regular,
			harfbuzz_features = {
				"zero",
			},
		},
		opts = {
			line_height = 1.2,
			font_size = 17,
		},
	},
}

local FONT = FONTS.Iosevka

config.font = wezterm.font(FONT.config)
config.line_height = FONT.opts.line_height
config.font_size = FONT.opts.font_size

config.font_rules = {
	{
		intensity = "Half",
		font = wezterm.font(FONT.config),
	},
	{
		italic = true,
		font = wezterm.font(FONT.config),
	},
}

config.front_end = "WebGpu"
config.disable_default_key_bindings = true

config.keys = {
	{ key = "-", mods = "CMD|SHIFT", action = act.SplitVertical },
	{ key = "-", mods = "CTRL", action = act.DecreaseFontSize },
	{ key = "=", mods = "CTRL", action = act.IncreaseFontSize },
	{ key = "D", mods = "CTRL|SHIFT", action = act.ShowDebugOverlay },
	{ key = "DownArrow", mods = "CMD", action = act.ActivatePaneDirection("Down") },
	{ key = "DownArrow", mods = "CMD|SHIFT", action = act.AdjustPaneSize({ "Down", 5 }) },
	{ key = "F", mods = "CTRL|SHIFT", action = act.ToggleFullScreen },
	{ key = "L", mods = "CTRL|SHIFT", action = wezterm.action.EmitEvent("toggle-ligature") },
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
	{ key = "PageUp", mods = "SHIFT", action = act.ScrollByPage(-1) },
	{ key = "PageDown", mods = "SHIFT", action = act.ScrollByPage(1) },
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

wezterm.on("format-tab-title", function(tab, tabs, panes, conf, hover, max_width)
	local pane = tab.active_pane
	local title = basename(pane.foreground_process_name) .. " " .. pane.pane_id
	local title = string.format(" %s  %s ~ %s  ", "❯", get_current_working_dir(tab))
	wezterm.log_info(pane.foreground_process_name)
	return {
		{ Text = title },
	}
end)

return config
