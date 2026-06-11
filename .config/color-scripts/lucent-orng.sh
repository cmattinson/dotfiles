cp ~/.config/starship-themes/lucent-orng.toml ~/.config/starship.toml
sd "config.color_scheme = .*" 'config.color_scheme = "Lucent Orng"' ~/.config/wezterm/wezterm.lua
sd 'colorscheme .*"' 'colorscheme lucent-orng"' ~/.config/nvim/lua/config/colorscheme.lua
sd "local BACKGROUND_COLOR = BACKGROUND_COLORS.*" "local BACKGROUND_COLOR = BACKGROUND_COLORS.LucentOrng" ~/.config/wezterm/wezterm.lua
