#!/bin/bash

cp ~/.config/starship-themes/material-deep-ocean.toml ~/.config/starship.toml
sd "config.color_scheme = .*" 'config.color_scheme = "Material Lighter (base16)"' ~/.config/wezterm/wezterm.lua
sd "enabled = true" "enabled = false" ~/.config/nvim/lua/plugins/colorschemes/*.lua
sd "enabled = false" "enabled = true" ~/.config/nvim/lua/plugins/colorschemes/material.lua
sd "local BACKGROUND_COLOR = BACKGROUND_COLORS.*" "local BACKGROUND_COLOR = BACKGROUND_COLORS.White" ~/.config/wezterm/wezterm.lua
sd "deep ocean" "lighter" ~/.config/nvim/lua/plugins/colorschemes/material.lua

