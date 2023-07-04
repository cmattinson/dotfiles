-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.default_domain = "WSL:Ubuntu-20.04"
config.color_scheme = "Horizon Dark (base16)"
config.font = wezterm.font("Hasklug Nerd Font Mono", { weight = "Bold" })
config.font_size = 11.4

config.keys = {
	{ key = "|", mods = "ALT|SHIFT", action = wezterm.action.SplitHorizontal },
	{ key = "%", mods = "ALT|SHIFT", action = wezterm.action.SplitVertical },
}

for i = 1, 8 do 
	table.insert(config.keys, {
		key = tostring(i),
		mods = "ALT",
		action = wezterm.action.ActivateTab(i - 1),
	})
end

-- and finally, return the configuration to wezterm
return config
