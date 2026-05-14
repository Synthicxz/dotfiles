-- Autostart commands from hyprland.conf and autostart.conf.

local paths = require("lua.paths")
local start = require("lua.helpers").start
local scrDir = paths.scrDir

hl.on("hyprland.start", function()
  start("hyprctl setcursor Bibata-Modern-Ice 24")
  start("dbus-update-activation-environment --systemd --all")
  start([[systemctl --user import-environment $(env | cut -d'=' -f1)]])
  start("uwsm-app -- wl-clip-persist --clipboard regular &")
  start("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
  start("uwsm-app -- wl-paste --watch cliphist store")
  start("uwsm-app -- awww-daemon")
  start("uwsm-app -- hypridle")
  start("uwsm-app -- swayosd-server")
  start("uwsm-app -- " .. scrDir .. "/battery-notify")
  start("uwsm-app -- kdeconnect-indicator")
  start("/usr/lib/kdeconnectd")
  start("sleep 1 && uwsm app -- waybar")
  start(scrDir .. "/first-run")
end)
