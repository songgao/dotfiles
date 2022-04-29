local wezterm = require 'wezterm';

return {
  font = wezterm.font("FuraCode NF"),

  keys = {
    { key = "k", mods = "CMD",
      action=wezterm.action{ClearScrollback="ScrollbackAndViewport"}},
    { key = "w", mods = "CMD",
      action=wezterm.action{CloseCurrentPane={confirm=true}}},

    { key = "d", mods = "CMD",
      action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
    { key = "d", mods = "CMD|SHIFT",
      action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},

    { key = "h", mods = "CTRL|CMD",
      action=wezterm.action{ActivatePaneDirection="Left"}},
    { key = "l", mods = "CTRL|CMD",
      action=wezterm.action{ActivatePaneDirection="Right"}},
    { key = "k", mods = "CTRL|CMD",
      action=wezterm.action{ActivatePaneDirection="Up"}},
    { key = "j", mods = "CTRL|CMD",
      action=wezterm.action{ActivatePaneDirection="Down"}},
    { key = "[", mods = "CMD",
      action=wezterm.action{ActivatePaneDirection="Prev"}},
    { key = "]", mods = "CMD",
      action=wezterm.action{ActivatePaneDirection="Next"}},

    { key = "h", mods = "CTRL|CMD|SHIFT",
      action=wezterm.action{AdjustPaneSize={"Left", 1}}},
    { key = "j", mods = "CTRL|CMD|SHIFT",
      action=wezterm.action{AdjustPaneSize={"Down", 1}}},
    { key = "k", mods = "CTRL|CMD|SHIFT",
      action=wezterm.action{AdjustPaneSize={"Up", 1}}},
    { key = "l", mods = "CTRL|CMD|SHIFT",
      action=wezterm.action{AdjustPaneSize={"Right", 1}}},
  },

  set_environment_variables = {
    MAIN = "",
    MAIL = "",
    ADHOC = ""
  }
}
