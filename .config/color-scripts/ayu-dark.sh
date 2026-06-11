cp ~/.config/starship-themes/ayu-dark.toml ~/.config/starship.toml
sd "config.color_scheme = .*" 'config.color_scheme = "Ayu Dark (Gogh)"' ~/.config/wezterm/wezterm.lua
sd 'colorscheme .*"' 'colorscheme ayu"' ~/.config/nvim/lua/config/colorscheme.lua
sd "local BACKGROUND_COLOR = BACKGROUND_COLORS.*" "local BACKGROUND_COLOR = BACKGROUND_COLORS.Ayu" ~/.config/wezterm/wezterm.lua
