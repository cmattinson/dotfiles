#!/bin/bash

cp ~/.config/starship-themes/mellifluous.toml ~/.config/starship.toml
sd "config.color_scheme = .*" 'config.color_scheme = "Mellifluous"' ~/.config/wezterm/wezterm.lua
sd "enabled = true" "enabled = false" ~/.config/nvim/lua/plugins/colorschemes/*.lua
sd "color_set = .*" 'color_set = "mellifluous",' ~/.config/nvim/lua/plugins/colorschemes/mellifluous.lua
sd "enabled = false" "enabled = true" ~/.config/nvim/lua/plugins/colorschemes/mellifluous.lua

