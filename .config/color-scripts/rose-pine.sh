#!/bin/bash

cp ~/.config/starship-themes/rose-pine.toml ~/.config/starship.toml
sd "config.color_scheme = .*" 'config.color_scheme = "rose-pine"' ~/.config/wezterm/wezterm.lua
sd "enabled = true" "enabled = false" ~/.config/nvim/lua/plugins/colorschemes/*.lua
sd "enabled = false" "enabled = true" ~/.config/nvim/lua/plugins/colorschemes/rose-pine.lua
