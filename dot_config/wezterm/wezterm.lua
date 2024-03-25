local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- https://wezfurlong.org/wezterm/shell-integration.html
-- Set default shell to fish
config.default_prog = { '/usr/bin/fish' }

config.leader = {
  key = 'a',
  mods = 'CTRL',
  timeout_milliseconds = 1000
}

config.color_scheme = 'catppuccin-mocha'
-- config.font = wezterm.font('MesloLGS Nerd Font')
config.font = wezterm.font('JetBrainsMono Nerd Font')
config.font_size = 14

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = true

-- Keybs
config.keys = {
  {
    key = 'r',
    mods = 'LEADER|SHIFT',
    action = wezterm.action.ReloadConfiguration,
  },
  {
    key = 'v',
    mods = 'LEADER',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'g',
    mods = 'LEADER',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'w',
    mods = 'LEADER',
    action = wezterm.action.CloseCurrentPane { confirm = false },
  },
  {
    key = 'h',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = 'j',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },
  {
    key = 'k',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = 'l',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
}

return config
