cp ~/.config/starship-themes/kanagawa.toml ~/.config/starship.toml
sd "config.color_scheme = .*" 'config.color_scheme = "Kanagawa (Gogh)"' ~/.config/wezterm/wezterm.lua
sd 'colorscheme .*"' 'colorscheme kanagawa"' ~/.config/nvim/lua/config/colorscheme.lua
sd "local BACKGROUND_COLOR = BACKGROUND_COLORS.*" "local BACKGROUND_COLOR = BACKGROUND_COLORS.Kanagawa" ~/.config/wezterm/wezterm.lua
