#!/bin/bash

cp ~/.config/starship-themes/material-deep-ocean.toml ~/.config/starship.toml
sd "config.color_scheme = .*" 'config.color_scheme = "MaterialOcean"' ~/.config/wezterm/wezterm.lua
sd "enabled = true" "enabled = false" ~/.config/nvim/lua/plugins/colorschemes/*.lua
sd "enabled = false" "enabled = true" ~/.config/nvim/lua/plugins/colorschemes/material.lua
