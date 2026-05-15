-- Jordan's modular Hyprland 0.55 Lua config.
-- Generated from the uploaded Symphony ~/.config/hypr/*.conf set.
-- Keep this on the hypr-lua-migration branch until tested.

local home = os.getenv("HOME") or "/home/jordan"

-- Make dotted require paths work from ~/.config/hypr/lua/*.lua.
package.path = home .. "/.config/hypr/?.lua;" .. home .. "/.config/hypr/?/init.lua;" .. package.path

local modules = {
  "lua.paths",
  "lua.helpers",
  "lua.colors",
  -- Original source order, mostly preserved from hyprland.conf.
  "lua.monitors",
  "lua.input",
  "lua.bindings",
  "lua.envs",
  "lua.looknfeel",
  "lua.autostart",
  "lua.animations",
  "lua.windowrules",
  "lua.tiling",
  "lua.media",
}

-- Clear all split-module caches before loading anything.
-- This makes `hyprctl reload` pick up edits across the modular files cleanly.
for _, module in ipairs(modules) do
  package.loaded[module] = nil
end

for _, module in ipairs(modules) do
  require(module)
end
