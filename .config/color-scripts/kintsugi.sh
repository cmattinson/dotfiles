cp ~/.config/starship-themes/kintsugi.toml ~/.config/starship.toml
sd "config.color_scheme = .*" 'config.color_scheme = "Kintsugi"' ~/.config/wezterm/wezterm.lua
sd 'colorscheme .*"' 'colorscheme kintsugi-dark"' ~/.config/nvim/lua/config/colorscheme.lua
sd "local BACKGROUND_COLOR = BACKGROUND_COLORS.*" "local BACKGROUND_COLOR = BACKGROUND_COLORS.Kintsugi" ~/.config/wezterm/wezterm.lua
