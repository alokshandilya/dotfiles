-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.font = wezterm.font("JetBrainsMono Nerd Font", {weight = 'Medium'})
config.font_size = 14.0
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 1.0

-- For example, changing the color scheme:
config.color_scheme = 'Gruvbox dark, hard (base16)'

-- and finally, return the configuration to wezterm
return config
