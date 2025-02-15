-- wezterm configuration file

local wezterm = require 'wezterm'
local act = wezterm.action
local config = {}

local TRANSPARENT = wezterm.color.from_hsla(0,0,0,0)
local lime = wezterm.color.parse('#bced09')
local fuchsia = wezterm.color.parse('#f20dc8')
local grey = wezterm.color.parse('#909090')
local ivory = wezterm.color.parse('#FFFDF0')
local dark = wezterm.color.parse('#333333')

config = {
  font = wezterm.font('Fira Code'),

  -- color_scheme = 'Molokai',
  color_scheme = 'Monokai Remastered',

  colors = {
    cursor_fg = 'black',
    cursor_bg = 'white',
    cursor_border = lime,
    compose_cursor = 'pink',

    tab_bar = {
      background = TRANSPARENT, -- changed
      new_tab = {
        fg_color = lime,
        bg_color = TRANSPARENT,  -- changed
      },
      new_tab_hover = {
        fg_color = TRANSPARENT,
        bg_color = lime,
      },
      inactive_tab = {
        bg_color = TRANSPARENT,
        fg_color = grey,
      },
      inactive_tab_hover = {
        bg_color = fuchsia,
        fg_color = TRANSPARENT,
      },
      active_tab = {
        bg_color = 'black',
        fg_color = ivory,
        intensity = 'Bold'
      },
    }
  },

  window_background_opacity = 0.95,
  text_background_opacity = 0.95,

  use_fancy_tab_bar = false,
  tab_bar_at_bottom = true,
  hide_tab_bar_if_only_one_tab = true,

  default_prog = { '/usr/bin/fish', '-l' },

  leader = { key = 'A', mods = 'CTRL|SHIFT', timeout_milliseconds = 1000 },

  keys = {
    { key = 'f', mods = 'LEADER', action = act.ActivateTabRelative(1) },
    {
      key = 'r',
      mods = 'LEADER',
      action = wezterm.action.ReloadConfiguration,
    },
    {
      key = 'k',
      mods = 'LEADER',
      action = act.Multiple {
        act.ClearScrollback 'ScrollbackAndViewport',
        act.SendKey { key = 'L', mods = 'CTRL' },
      },

    }
  },
}

return config
