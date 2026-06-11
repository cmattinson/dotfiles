cp ~/.config/starship-themes/material-lighter.toml ~/.config/starship.toml
sd "config.color_scheme = .*" 'config.color_scheme = "Material"' ~/.config/wezterm/wezterm.lua
sd 'colorscheme .*"' 'colorscheme material"' ~/.config/nvim/lua/config/colorscheme.lua
sd "local BACKGROUND_COLOR = BACKGROUND_COLORS.*" "local BACKGROUND_COLOR = BACKGROUND_COLORS.White" ~/.config/wezterm/wezterm.lua
sd "material_ocean_scheme\(\)" "material_scheme()" ~/.config/wezterm/wezterm.lua
sd 'material_style = "deep ocean"' 'material_style = "lighter"' ~/.config/nvim/lua/plugins/colorschemes/material.lua
