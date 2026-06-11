cp ~/.config/starship-themes/oasis.toml ~/.config/starship.toml
sd "config.color_scheme = .*" 'config.color_scheme = "Oasis Abyss Dark"' ~/.config/wezterm/wezterm.lua
sd 'colorscheme .*"' 'colorscheme oasis"' ~/.config/nvim/lua/config/colorscheme.lua
sd "local BACKGROUND_COLOR = BACKGROUND_COLORS.*" "local BACKGROUND_COLOR = BACKGROUND_COLORS.Oasis" ~/.config/wezterm/wezterm.lua
