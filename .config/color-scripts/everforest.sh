cp ~/.config/starship-themes/everforest.toml ~/.config/starship.toml
sd "config.color_scheme = .*" 'config.color_scheme = "Everforest Dark Soft (Gogh)"' ~/.config/wezterm/wezterm.lua
sd 'colorscheme .*"' 'colorscheme everforest"' ~/.config/nvim/lua/config/colorscheme.lua
sd "local BACKGROUND_COLOR = BACKGROUND_COLORS.*" "local BACKGROUND_COLOR = BACKGROUND_COLORS.Everforest" ~/.config/wezterm/wezterm.lua
