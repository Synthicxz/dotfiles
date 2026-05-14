-- Shared paths/program names. Edit these first when changing launchers/scripts.

local home = os.getenv("HOME") or "/home/jordan"

return {
  home = home,
  terminal = "kitty",
  browser = home .. "/.config/hypr/scripts/launch-browser",
  webapp = home .. "/.config/hypr/scripts/launch-webapp",
  focus = home .. "/.config/hypr/scripts/focus",
  rofiDir = home .. "/.config/rofi/scripts",
  scrDir = home .. "/.config/hypr/scripts",
  screenrecord = home .. "/.config/hypr/scripts/screenrecord",
  osdclient = [=[swayosd-client --monitor "$(hyprctl monitors -j | jq -r '.[] | select(.focused == true).name')"]=],
}
