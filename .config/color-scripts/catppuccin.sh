cp ~/.config/starship-themes/catppuccin.toml ~/.config/starship.toml
sd "config.color_scheme = .*" 'config.color_scheme = "Catppuccin Macchiato"' ~/.config/wezterm/wezterm.lua
sd 'colorscheme .*"' 'colorscheme catppuccin"' ~/.config/nvim/lua/config/colorscheme.lua
sd "local BACKGROUND_COLOR = BACKGROUND_COLORS.*" "local BACKGROUND_COLOR = BACKGROUND_COLORS.Catppuccin" ~/.config/wezterm/wezterm.lua
