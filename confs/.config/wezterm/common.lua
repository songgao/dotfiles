local wezterm = require 'wezterm';

local sep = "      "

local function get_stats()
  local success, stdout, stderr = wezterm.run_child_process({ "bash", "-c",
    [[top -l 1 -s 0 -n0 | grep 'CPU\|PhysMem' | sed 's/CPU.*sys, \(.*\) idle/CPU: \1 Idle/' | sed 's/PhysMem.* (\(.*\) wired).*/RAM: \1 Wired/']] })
  if (not success) then
    return ""
  end
  return string.gsub(stdout, "\n", sep)
end

local function get_battery()
  local str = "BAT "
  for _, b in ipairs(wezterm.battery_info()) do
    str = str .. string.format('%.0f%%', b.state_of_charge * 100) .. " "
  end
  return str
end

wezterm.on("update-right-status", function(window, pane)
  local date = wezterm.strftime("%H:%M:%S | %b %d, %Y");
  local stats = get_stats()
  local battery = get_battery()

  -- Make it italic and underlined
  window:set_right_status(wezterm.format({
    { Foreground = { Color = "#88FF88" } },
    { Text = battery .. sep },
    { Text = stats .. sep },
    { Foreground = { Color = "#FFFFFF" } },
    { Text = date .. sep },
  }));
end);

return {
  font = wezterm.font("FiraCode NF"),

  exit_behavior = "Close",

  keys = {
    { key = "k", mods = "CMD",
      action = wezterm.action { ClearScrollback = "ScrollbackAndViewport" } },
    { key = "w", mods = "CMD",
      action = wezterm.action { CloseCurrentPane = { confirm = true } } },

    { key = "d", mods = "CMD",
      action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } } },
    { key = "d", mods = "CMD|SHIFT",
      action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } } },

    { key = "h", mods = "CTRL|CMD",
      action = wezterm.action { ActivatePaneDirection = "Left" } },
    { key = "l", mods = "CTRL|CMD",
      action = wezterm.action { ActivatePaneDirection = "Right" } },
    { key = "k", mods = "CTRL|CMD",
      action = wezterm.action { ActivatePaneDirection = "Up" } },
    { key = "j", mods = "CTRL|CMD",
      action = wezterm.action { ActivatePaneDirection = "Down" } },
    { key = "[", mods = "CMD",
      action = wezterm.action { ActivatePaneDirection = "Prev" } },
    { key = "]", mods = "CMD",
      action = wezterm.action { ActivatePaneDirection = "Next" } },

    { key = "h", mods = "CTRL|CMD|SHIFT",
      action = wezterm.action { AdjustPaneSize = { "Left", 1 } } },
    { key = "j", mods = "CTRL|CMD|SHIFT",
      action = wezterm.action { AdjustPaneSize = { "Down", 1 } } },
    { key = "k", mods = "CTRL|CMD|SHIFT",
      action = wezterm.action { AdjustPaneSize = { "Up", 1 } } },
    { key = "l", mods = "CTRL|CMD|SHIFT",
      action = wezterm.action { AdjustPaneSize = { "Right", 1 } } },
  },

  mouse_bindings = {
    {
      event = { Down = { streak = 1, button = 'Middle' } },
      mods = 'NONE',
      action = wezterm.action.Nop,
    },
  },

  set_environment_variables = {
    MAIN = "",
    MAIL = "",
    ADHOC = "",
    VM = "",
    PKI = ""
  }
}
