-- Laptop multimedia/media player keys from media.conf.

local paths = require("lua.paths")
local helpers = require("lua.helpers")
local bind_exec = helpers.bind_exec

local osdclient = paths.osdclient
local scrDir = paths.scrDir

bind_exec("XF86AudioRaiseVolume", osdclient .. " --output-volume raise", "Volume up", { locked = true, repeating = true })
bind_exec("XF86AudioLowerVolume", osdclient .. " --output-volume lower", "Volume down", { locked = true, repeating = true })
bind_exec("XF86AudioMute", osdclient .. " --output-volume mute-toggle", "Mute", { locked = true, repeating = true })
bind_exec("XF86AudioMicMute", osdclient .. " --input-volume mute-toggle", "Mute microphone", { locked = true, repeating = true })
bind_exec("XF86MonBrightnessUp", osdclient .. " --brightness raise", "Brightness up", { locked = true, repeating = true })
bind_exec("XF86MonBrightnessDown", osdclient .. " --brightness lower", "Brightness down", { locked = true, repeating = true })

bind_exec("ALT + XF86AudioRaiseVolume", osdclient .. " --output-volume +1", "Volume up precise", { locked = true, repeating = true })
bind_exec("ALT + XF86AudioLowerVolume", osdclient .. " --output-volume -1", "Volume down precise", { locked = true, repeating = true })
bind_exec("ALT + XF86MonBrightnessUp", osdclient .. " --brightness +1", "Brightness up precise", { locked = true, repeating = true })
bind_exec("ALT + XF86MonBrightnessDown", osdclient .. " --brightness -1", "Brightness down precise", { locked = true, repeating = true })

bind_exec("XF86AudioNext", osdclient .. " --playerctl next", "Next track", { locked = true })
bind_exec("XF86AudioPause", osdclient .. " --playerctl play-pause", "Pause", { locked = true })
bind_exec("XF86AudioPlay", osdclient .. " --playerctl play-pause", "Play", { locked = true })
bind_exec("XF86AudioPrev", osdclient .. " --playerctl previous", "Previous track", { locked = true })

bind_exec("SUPER + XF86AudioMute", scrDir .. "/audio-switch", "Switch audio output", { locked = true })

bind_exec("SUPER + F9", "mpc pause", "mpc pause")
bind_exec("SUPER + F10", "mpc prev", "mpc prev")
bind_exec("SUPER + F11", "mpc play", "mpc play")
bind_exec("SUPER + F12", "mpc next", "mpc next")
