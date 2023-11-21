local wezterm = require 'wezterm'
local config = {}
local act = wezterm.action

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = 'Catppuccin Mocha'
config.font = wezterm.font { family = "FiraCode Nerd Font", weight = "Regular" }
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
config.window_background_opacity = 0.8
config.hide_tab_bar_if_only_one_tab = true

wezterm.on('update-right-status', function(window, pane)
  window:set_right_status(window:active_workspace())
end)

config.leader = { key = "x", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
  -- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
  {
    key = 'x',
    mods = 'LEADER|CTRL',
    action = wezterm.action.SendKey { key = 'x', mods = 'CTRL' },
  },
  { key = "%", mods = "LEADER|SHIFT", action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
  { key = "=", mods = "LEADER", action = act.SplitVertical { domain = "CurrentPaneDomain" } },
  { key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
  { key = "v", mods = "LEADER", action = "ActivateCopyMode" },
  { key = "c", mods = "LEADER", action = act.SpawnTab "CurrentPaneDomain" },
  { key = "h", mods = "LEADER", action = act.ActivatePaneDirection "Left" },
  { key = "j", mods = "LEADER", action = act.ActivatePaneDirection "Down" },
  { key = "k", mods = "LEADER", action = act.ActivatePaneDirection "Up" },
  { key = "l", mods = "LEADER", action = act.ActivatePaneDirection "Right" },
  { key = "H", mods = "LEADER|SHIFT", action = act.AdjustPaneSize { "Left", 5 } },
  { key = "J", mods = "LEADER|SHIFT", action = act.AdjustPaneSize { "Down", 5 } },
  { key = "K", mods = "LEADER|SHIFT", action = act.AdjustPaneSize { "Up", 5 } },
  { key = "L", mods = "LEADER|SHIFT", action = act.AdjustPaneSize { "Right", 5 } },
  { key = "n", mods = "LEADER", action = act { ActivateTabRelative = 1 } },
  { key = "p", mods = "LEADER", action = act { ActivateTabRelative = -1 } },
  { key = "1", mods = "LEADER|SHIFT", action = act { ActivateTab = 0 } },
  { key = "2", mods = "LEADER|SHIFT", action = act { ActivateTab = 1 } },
  { key = "3", mods = "LEADER|SHIFT", action = act { ActivateTab = 2 } },
  { key = "4", mods = "LEADER|SHIFT", action = act { ActivateTab = 3 } },
  { key = "5", mods = "LEADER|SHIFT", action = act { ActivateTab = 4 } },
  { key = "6", mods = "LEADER|SHIFT", action = act { ActivateTab = 5 } },
  { key = 'LeftArrow', mods = 'CTRL|SHIFT', action = act.MoveTabRelative(-1) },
  { key = 'RightArrow', mods = 'CTRL|SHIFT', action = act.MoveTabRelative(1) },
  { key = "d", mods = "LEADER", action = act.CloseCurrentPane { confirm = true } },
  { key = "x", mods = "LEADER", action = act.CloseCurrentPane { confirm = true } },
  { key = 's', mods = "LEADER", action = act.ShowLauncherArgs { flags = 'WORKSPACES' } },
  -- Prompt for a name to use for a new workspace and switch to it.
  {
    key = 'W',
    mods = 'CTRL|SHIFT',
    action = act.PromptInputLine {
      description = wezterm.format {
        { Attribute = { Intensity = 'Bold' } },
        { Foreground = { AnsiColor = 'Fuchsia' } },
        { Text = 'Enter name for new workspace' },
      },
      action = wezterm.action_callback(function(window, pane, line)
        -- line will be `nil` if they hit escape without entering anything
        -- An empty string if they just hit enter
        -- Or the actual line of text they wrote
        if line then
          window:perform_action(
            act.SwitchToWorkspace {
              name = line,
            },
            pane
          )
        end
      end),
    },
  },
  -- Switch to the default workspace
  {
    key = 'Y',
    mods = 'CTRL|SHIFT',
    action = act.SwitchToWorkspace {
      name = 'default',
    },
  },
  -- Switch to spotify workspace
  {
    key = 'S',
    mods = 'CTRL|SHIFT',
    action = act.SwitchToWorkspace {
      name = 'spotify',
      spawn = {
        args = { 'spotify_player' },
      },
    },
  },
  {
    key = '9',
    mods = 'CTRL',
    action = act.PaneSelect {
      alphabet = 'qsdfghjklm',
    },
  },
  -- show the pane selection mode, but have it swap the active and selected panes
  {
    key = '0',
    mods = 'CTRL',
    action = act.PaneSelect {
      alphabet = 'qsdfghjklm',
      mode = 'SwapWithActive',
    },
  },
}


local copy_mode_table = nil
local search_mode_table = nil
if wezterm.gui then
  copy_mode_table = wezterm.gui.default_key_tables().copy_mode
  -- When the search pattern is an empty string the existing pattern is preserved
  table.insert(
    copy_mode_table,
    { key = "/", mods = "SHIFT", action = wezterm.action { Search = { CaseSensitiveString = "" } } }
  )
  -- navigate any search mode results
  table.insert(
    copy_mode_table,
    { key = "n", mods = "NONE", action = wezterm.action { CopyMode = "NextMatch" } }
  )
  table.insert(
    copy_mode_table,
    { key = "N", mods = "SHIFT", action = act.CopyMode "PriorMatch" }
  )
  table.insert(
    copy_mode_table,
    { key = "_", mods = "NONE", action = act.CopyMode "MoveToStartOfLineContent" }
  )
  search_mode_table = wezterm.gui.default_key_tables().search_mode
  table.insert(
    search_mode_table,
    { key = "Enter", mods = "NONE", action = "ActivateCopyMode" }
  )

  -- Go back to copy mode when pressing enter, so that we can use unmodified keys like "n"
  -- to navigate search results without conflicting with typing into the search area.
  table.insert(
    search_mode_table,
    { key = "Escape", mods = "NONE", action = wezterm.action { CopyMode = "Close" } }
  )
  config.key_tables = {
    copy_mode = copy_mode_table,
    search_mode = search_mode_table,
  }
end

return config
