local wezterm = require 'wezterm'
local config = {}

config.color_scheme = 'Catppuccin Mocha'
config.font = wezterm.font { family = "FiraCode Nerd Font", weight = "Regular"}
config.font_size = 12
config.font_rules = {
  {
    intensity = 'Bold',
    italic = false,
    font = wezterm.font {
      family = 'FiraCode Nerd Font',
      weight = 'DemiBold',
    },
  },
  {
    intensity = 'Bold',
    italic = true,
    font = wezterm.font {
      family = 'VictorMono Nerd Font',
      weight = 'DemiBold',
      style = 'Italic',
    },
  },
  {
    italic = true,
    intensity = 'Normal',
    font = wezterm.font {
      family = 'VictorMono Nerd Font',
      weight = 'Medium',
      style = 'Italic',
    },
  },
}
config.enable_tab_bar = false
config.window_background_opacity = 0.75

return config
