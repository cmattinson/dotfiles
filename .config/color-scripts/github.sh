cp ~/.config/starship-themes/github.toml ~/.config/starship.toml
sd "config.color_scheme = .*" 'config.color_scheme = "GitHub Dark"' ~/.config/wezterm/wezterm.lua
sd 'colorscheme .*"' 'colorscheme github_dark"' ~/.config/nvim/lua/config/colorscheme.lua
sd "local BACKGROUND_COLOR = BACKGROUND_COLORS.*" "local BACKGROUND_COLOR = BACKGROUND_COLORS.GitHub" ~/.config/wezterm/wezterm.lua
