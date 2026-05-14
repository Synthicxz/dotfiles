-- Tiling, workspace, and movement binds from tiling.conf.
-- Loaded after bindings.lua to preserve the old source order/override behavior.

local helpers = require("lua.helpers")
local bind = helpers.bind

-- The old dwindle pseudo option was removed in 0.55; keep preserve_split and use the pseudo dispatcher bind.
hl.config({
  dwindle = {
    preserve_split = true,
  },
})

bind("SUPER + F", hl.dsp.window.fullscreen({}), "Fullscreen")

for i = 1, 10 do
  local keycode = 9 + i -- Old config used code:10..19 for workspaces 1..10.
  bind("SUPER + code:" .. keycode, hl.dsp.focus({ workspace = i }), "Switch to workspace " .. i)
  bind("SUPER + SHIFT + code:" .. keycode, hl.dsp.window.move({ workspace = i }), "Move window to workspace " .. i)
end

bind("ALT + TAB", function()
  hl.dispatch(hl.dsp.window.cycle_next())
  hl.dispatch(hl.dsp.window.bring_to_top())
end, "Cycle to next window and reveal it on top")

bind("SUPER + TAB", hl.dsp.focus({ workspace = "previous" }))

bind("SUPER + SHIFT + LEFT", hl.dsp.window.swap({ direction = "l" }), "Swap window to the left")
bind("SUPER + SHIFT + RIGHT", hl.dsp.window.swap({ direction = "r" }), "Swap window to the right")
bind("SUPER + SHIFT + UP", hl.dsp.window.swap({ direction = "u" }), "Swap window up")
bind("SUPER + SHIFT + DOWN", hl.dsp.window.swap({ direction = "d" }), "Swap window down")

bind("SUPER + LEFT", hl.dsp.focus({ direction = "l" }), "Move window focus left")
bind("SUPER + RIGHT", hl.dsp.focus({ direction = "r" }), "Move window focus right")
bind("SUPER + UP", hl.dsp.focus({ direction = "u" }), "Move window focus up")
bind("SUPER + DOWN", hl.dsp.focus({ direction = "d" }), "Move window focus down")

bind("SUPER + H", hl.dsp.focus({ direction = "l" }), "Move window focus left")
bind("SUPER + L", hl.dsp.focus({ direction = "r" }), "Move window focus right")
bind("SUPER + K", hl.dsp.focus({ direction = "u" }), "Move window focus up")
bind("SUPER + J", hl.dsp.focus({ direction = "d" }), "Move window focus down")

bind("ALT + J", hl.dsp.layout("togglesplit"), "Toggle split")
bind("SUPER + V", hl.dsp.window.pseudo(), "Pseudo window")
bind("SUPER + SHIFT + V", hl.dsp.window.float({ action = "toggle" }), "Toggle floating")

bind("SUPER + CTRL + LEFT", hl.dsp.focus({ workspace = "e-1" }))
bind("SUPER + CTRL + RIGHT", hl.dsp.focus({ workspace = "e+1" }))

bind("SUPER + code:20", hl.dsp.window.resize({ x = -100, y = 0, relative = true }), "Expand window left")
bind("SUPER + code:21", hl.dsp.window.resize({ x = 100, y = 0, relative = true }), "Shrink window left")

bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }), "Scroll active workspace forward")
bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }), "Scroll active workspace backward")

bind("SUPER + mouse:272", hl.dsp.window.drag(), "Move window", { mouse = true })
bind("SUPER + mouse:273", hl.dsp.window.resize(), "Resize window", { mouse = true })
