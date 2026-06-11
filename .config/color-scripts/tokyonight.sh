cp ~/.config/starship-themes/tokyonight.toml ~/.config/starship.toml
sd "config.color_scheme = .*" 'config.color_scheme = "Tokyo Night"' ~/.config/wezterm/wezterm.lua
sd 'colorscheme .*"' 'colorscheme tokyonight"' ~/.config/nvim/lua/config/colorscheme.lua
sd "local BACKGROUND_COLOR = BACKGROUND_COLORS.*" "local BACKGROUND_COLOR = BACKGROUND_COLORS.TokyoNight" ~/.config/wezterm/wezterm.lua
