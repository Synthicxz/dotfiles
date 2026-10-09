-- Monitor setup from monitors.conf.

local helpers = require("lua.helpers")
local bind_exec = helpers.bind_exec

-- LG, main monitor
hl.monitor({ output = "DP-2", mode = "2560x1440@143", position = "0x0", scale = 1 })
-- ASUS, left monitor
hl.monitor({ output = "DP-3", mode = "1920x1080@60", position = "2560x0", scale = 1 })

-- Workspaces 1- 4 on main
for i = 1, 4 do
  hl.workspace_rule({
    workspace = tostring(i),
    monitor = "DP-2",
    persistent = true,
    default = i == 1,
  })
end

-- Workspaces 5-10 on left ASUS
for i = 5, 10 do
  hl.workspace_rule({
    workspace = tostring(i),
    monitor = "DP-3",
    persistent = true,
    default = i == 6,
  })
end

-- Laptop screen toggle.
bind_exec("SUPER + ALT + H", [[hyprctl keyword monitor "eDP-1,disable"]], "Laptop screen off")
bind_exec("SUPER + ALT + L", [[hyprctl keyword monitor "eDP-1, preferred, 0x0, 1"]], "Laptop screen on")
