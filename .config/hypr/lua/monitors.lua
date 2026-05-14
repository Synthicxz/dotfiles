-- Monitor setup from monitors.conf.

local helpers = require("lua.helpers")
local bind_exec = helpers.bind_exec

hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@100", position = "auto", scale = 1 })
hl.monitor({ output = "eDP-1", mode = "preferred", position = "0x0", scale = 1 })

-- Laptop screen toggle.
bind_exec("SUPER + ALT + H", [[hyprctl keyword monitor "eDP-1,disable"]], "Laptop screen off")
bind_exec("SUPER + ALT + L", [[hyprctl keyword monitor "eDP-1, preferred, 0x0, 1"]], "Laptop screen on")
