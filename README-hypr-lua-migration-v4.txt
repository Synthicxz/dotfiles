Hyprland Lua migration package v4
=================================

Contents:
  .config/hypr/hyprland.lua
  .config/hypr/lua/*.lua

Install from inside ~/symphony:
  tar -xzf ~/Downloads/hypr-lua-migration-jordan-v4.tar.gz -C ~/symphony

First switch from hyprland.conf to hyprland.lua:
  Log out/back in or restart Hyprland. Hyprland chooses Lua vs legacy config at startup.

After login:
  hyprctl configerrors
  hyprctl binds | grep -i 'Terminal\|Screenshot\|Record\|waybar' | head -40

Rollback:
  mv ~/.config/hypr/hyprland.lua ~/.config/hypr/hyprland.lua.broken
  restart Hyprland / log out and back in

Notes:
  - hypridle.conf, hyprlock.conf, hyprsunset.conf, and scripts/* are intentionally untouched.
  - colors.lua reads Symphony/matugen's generated Hyprlang colors.conf instead of replacing matugen.
  - SUPER+ALT+R now uses ~/.config/hypr/scripts/screenrecord, which exists in the uploaded config, instead of ~/Scripts/screenrecord.
  - dwindle:pseudotile was removed because Hyprland 0.55 removed/deprecated that old setting; SUPER+V still uses the pseudo dispatcher.
