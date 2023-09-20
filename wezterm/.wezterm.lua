local wezterm = require 'wezterm'
local config = {}
local act = wezterm.action

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = 'Catppuccin Mocha'
config.font = wezterm.font { family = "FiraCode Nerd Font", weight = "Regular"}
config.font_size = 11
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
config.enable_tab_bar = true
config.window_background_opacity = 0.6
config.leader = { key = "x", mods = "CTRL", timeout_milliseconds = 1000 }
config.hide_tab_bar_if_only_one_tab = true
config.keys = {
  -- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
  {
    key = 'x',
    mods = 'LEADER|CTRL',
    action = wezterm.action.SendKey { key = 'x', mods = 'CTRL' },
  },
  { key = "%", mods = "LEADER|SHIFT", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
  { key = "=", mods = "LEADER",       action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
  { key = "z", mods = "LEADER",       action="TogglePaneZoomState" },
  { key = "v", mods = "LEADER",       action="ActivateCopyMode" },
  { key = "c", mods = "LEADER",       action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
  { key = "h", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Left"}},
  { key = "j", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Down"}},
  { key = "k", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Up"}},
  { key = "l", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Right"}},
  { key = "H", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Left", 5}}},
  { key = "J", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Down", 5}}},
  { key = "K", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Up", 5}}},
  { key = "L", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Right", 5}}},
  { key = "n", mods = "LEADER",       action=wezterm.action{ActivateTabRelative=1}},
  { key = "p", mods = "LEADER",       action=wezterm.action{ActivateTabRelative=-1}},
  { key = "&", mods = "LEADER",       action=wezterm.action{ActivateTab=0}},
  { key = "é", mods = "LEADER",       action=wezterm.action{ActivateTab=1}},
  { key = "\"",mods = "LEADER",       action=wezterm.action{ActivateTab=2}},
  { key = "'", mods = "LEADER",       action=wezterm.action{ActivateTab=3}},
  { key = "(", mods = "LEADER",       action=wezterm.action{ActivateTab=4}},
  { key = "-", mods = "LEADER",       action=wezterm.action{ActivateTab=5}},
  { key = "è", mods = "LEADER",       action=wezterm.action{ActivateTab=6}},
  { key = "_", mods = "LEADER",       action=wezterm.action{ActivateTab=7}},
  { key = "ç", mods = "LEADER",       action=wezterm.action{ActivateTab=8}},
  { key = "d", mods = "LEADER",       action=wezterm.action{CloseCurrentPane={confirm=true}}},
  { key = "x", mods = "LEADER",       action=wezterm.action{CloseCurrentPane={confirm=true}}},
  -- Show the launcher in fuzzy selection mode and have it list all workspaces
  -- and allow activating one.
  {
    key = 's',
    mods = 'LEADER',
    action = wezterm.action.ShowLauncherArgs {
      flags = 'FUZZY|WORKSPACES',
    },
  },
}
-- config.key_tables = {
--   copy_mode = {
--     {key="Escape", mods="NONE", action=wezterm.action{CopyMode="Close"}},
--     {key="h", mods="NONE", action=wezterm.action{CopyMode="MoveLeft"}},
--     {key="j", mods="NONE", action=wezterm.action{CopyMode="MoveDown"}},
--     {key="k", mods="NONE", action=wezterm.action{CopyMode="MoveUp"}},
--     {key="l", mods="NONE", action=wezterm.action{CopyMode="MoveRight"}},
--     -- When the search pattern is an empty string the existing pattern is preserved
--     {key="/", mods="SHIFT", action=wezterm.action{Search={CaseSensitiveString=""}}},
--     -- navigate any search mode results
--     {key="n", mods="NONE", action=wezterm.action{CopyMode="NextMatch"}},
--     {key="N", mods="SHIFT", action=wezterm.action{CopyMode="PriorMatch"}},
--   },
--   search_mode = {
--     {key="Escape", mods="NONE", action=wezterm.action{CopyMode="Close"}},
--     -- Go back to copy mode when pressing enter, so that we can use unmodified keys like "n"
--     -- to navigate search results without conflicting with typing into the search area.
--     {key="Enter", mods="NONE", action="ActivateCopyMode"},
--   },
-- }

return config
