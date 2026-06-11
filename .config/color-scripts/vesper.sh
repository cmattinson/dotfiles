cp ~/.config/starship-themes/vesper.toml ~/.config/starship.toml
sd "config.color_scheme = .*" 'config.color_scheme = "Vesper"' ~/.config/wezterm/wezterm.lua
sd 'colorscheme .*"' 'colorscheme vesper"' ~/.config/nvim/lua/config/colorscheme.lua
sd "local BACKGROUND_COLOR = BACKGROUND_COLORS.*" "local BACKGROUND_COLOR = BACKGROUND_COLORS.Vesper" ~/.config/wezterm/wezterm.lua
