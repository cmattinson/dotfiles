cp ~/.config/starship-themes/material-deep-ocean.toml ~/.config/starship.toml
sd "config.color_scheme = .*" 'config.color_scheme = "MaterialOcean"' ~/.config/wezterm/wezterm.lua
sd 'colorscheme .*"' 'colorscheme material"' ~/.config/nvim/lua/config/colorscheme.lua
sd "local BACKGROUND_COLOR = BACKGROUND_COLORS.*" "local BACKGROUND_COLOR = BACKGROUND_COLORS.Black" ~/.config/wezterm/wezterm.lua
sd "material_scheme\(\)" "material_ocean_scheme()" ~/.config/wezterm/wezterm.lua
sd 'material_style = "lighter"' 'material_style = "deep ocean"' ~/.config/nvim/lua/plugins/colorschemes/material.lua
