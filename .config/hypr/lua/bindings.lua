-- Application/script keybindings from bindings.conf.

local paths = require("lua.paths")
local helpers = require("lua.helpers")
local bind = helpers.bind
local bind_exec = helpers.bind_exec

local terminal = paths.terminal
local browser = paths.browser
local webapp = paths.webapp
local focus = paths.focus
local rofiDir = paths.rofiDir
local scrDir = paths.scrDir
local osdclient = paths.osdclient
local home = paths.home
local screenrecord = paths.screenrecord

bind_exec("SUPER + RETURN", [[uwsm-app -- ]] .. terminal .. [[ --dir="$(cwd-terminal)"]], "Terminal")
bind_exec("SUPER + B", browser, "Browser")
bind_exec("SUPER + E", "uwsm app -- nautilus --new-window", "File manager")
bind_exec("SUPER + M", focus .. " spotify-launcher", "Music")
bind_exec("SUPER + D", "uwsm app -- vesktop", "Discord")
bind_exec("SUPER + O", "obsidian", "Obsidian")
bind_exec("SUPER + slash", "uwsm app -- bitwarden-desktop", "Passwords")
bind_exec("SUPER + C", "uwsm app -- zeditor", "Zed")
bind_exec("SUPER + SHIFT + D", terminal .. " -e lazydocker", "Docker")
bind_exec("ALT + slash", terminal .. " -e btop", "Activity")
bind_exec("ALT + M", terminal .. " -e rmpc", "Music")
bind_exec("ALT + Q", terminal .. " -e yazi", "Yazi")
bind_exec("ALT + N", terminal .. " -e nvim", "Neovim")
bind_exec("SUPER + S", terminal .. " --class=Wiremix -e wiremix", "Wiremix")
bind_exec("SUPER + ALT + M", "easyeffects", "Easyeffects")

bind_exec("SUPER + A", webapp .. [[ "https://perplexity.ai"]], "Perplexity")
bind_exec("SUPER + SHIFT + A", webapp .. [[ "https://chatgpt.com"]], "ChatGPT")
bind_exec("SUPER + CTRL + A", webapp .. [[ "https://gemini.google.com"]], "Gemini")
bind_exec("ALT + C", webapp .. [[ "https://calendar.google.com"]], "Calendar")
bind_exec("SUPER + G", webapp .. [[ "https://github.com/vyrx-dev"]], "Github")
bind_exec("SUPER + SHIFT + G", webapp .. [[ "https://mail.google.com/mail/u/1/"]], "Gmail")
bind_exec("SUPER + Y", webapp .. [[ "https://youtube.com/"]], "YouTube")
bind_exec("SUPER + W", webapp .. [[ "https://web.whatsapp.com/"]], "WhatsApp")
bind_exec("SUPER + X", webapp .. [[ "https://x.com/"]], "X")
bind_exec("SUPER + Z", webapp .. [[ "https://www.linkedin.com/feed/"]], "LinkedIn")
bind_exec("SUPER + T", webapp .. [[ "https://app.todoist.com"]], "Todoist")
bind_exec("SUPER + BACKSLASH", webapp .. [[ "https://devhints.io/"]], "Learn")

bind_exec("SUPER + SHIFT + RETURN", terminal .. " -e tmux a")
bind_exec("SUPER + ALT + RETURN", terminal .. " -e tmux new -As main")

bind_exec("SUPER + SHIFT + N", rofiDir .. "/wifi.sh", "Wifi Menu")
bind_exec("SUPER + N", "swaync-client -t -sw", "Notification Centre")
bind_exec("SUPER + SHIFT + I", "kitty --title webapp-install -e " .. scrDir .. "/webapp-install", "Web App Install")

bind("SUPER + Q", hl.dsp.window.close())

bind_exec("ALT + comma", rofiDir .. "/clipboard", "Clipboard")
bind_exec("SUPER + SHIFT + M", rofiDir .. "/rofibeats", "Rofibeats")
bind_exec("ALT + period", rofiDir .. "/emoji", "Emoji")
bind_exec("ALT + SPACE", rofiDir .. "/rofisearch", "Find")
bind_exec("SUPER + SPACE", "pkill rofi || rofi -show drun", "App launcher")
bind_exec("SUPER + CTRL + B", rofiDir .. "/power-profiles", "Power Profiles")

bind_exec("SUPER + SHIFT + O", scrDir .. "/pop-window", "Pop window out (float & pin)")
bind_exec("SUPER + SHIFT + SPACE", scrDir .. "/toggle-waybar")
bind_exec("SUPER + CTRL + N", scrDir .. "/nightlight")
bind_exec("SUPER + CTRL + I", scrDir .. "/toggle-idle", "Toggle Idle/Lock")

bind_exec("SUPER + ALT + S", "kitty --title share -e " .. scrDir .. "/fileshare file")
bind_exec("SUPER + CTRL + S", "kitty --title share -e " .. scrDir .. "/fileshare folder")
bind_exec("SUPER + SHIFT + S", "kitty --title share -e " .. scrDir .. "/fileshare clipboard")

bind_exec("SUPER + CTRL + SPACE", rofiDir .. "/selectWall", "Matugen Themes Apply")
bind_exec("SUPER + ALT + SPACE", rofiDir .. "/wallPicker", "Wallpaper Picker")
bind_exec("CTRL + ALT + SPACE", scrDir .. "/change-theme", "Select swww wall")
bind_exec("SUPER + CTRL + SHIFT + SPACE", "symphony switch", "Theme Switcher")
bind_exec("SUPER + CTRL + SHIFT + BACKSPACE", "symphony switch --random", "Theme Switcher")
bind_exec("SUPER + I", "kitty --title symphony-tui -e symphony-tui", "Symphony TUI")
bind_exec("SUPER + ALT + I", "kitty --title symphony-browse -e symphony browse", "Browse Themes")

bind_exec("SUPER + ALT + UP", scrDir .. "/cycle-wallpaper", "Theme Wallpapers")
bind_exec("SUPER + ALT + RIGHT", scrDir .. "/cycle-wallpaper next", "Next Wallpaper")
bind_exec("SUPER + ALT + LEFT", scrDir .. "/cycle-wallpaper prev", "Previous Wallpaper")

bind_exec("SUPER + SHIFT + L", scrDir .. "/lock-screen", "Lock screen")
bind_exec("SUPER + CTRL + UP", scrDir .. "/graceful-reboot", "Reboot")
bind_exec("SUPER + BACKSPACE", scrDir .. "/toggle-terminal-transparency", "Terminal Transparency")
bind_exec("SUPER + CTRL + BACKSPACE", scrDir .. "/toggle-focus", "Toggle focus & vibe mode")
bind_exec("SUPER + ESCAPE", rofiDir .. "/powermenu", "Powermenu")
bind_exec("XF86PowerOff", rofiDir .. "/powermenu", "Power menu", { locked = true })

bind_exec("SUPER + SHIFT + K", "hyprctl kill", "Kill application")
bind_exec("SUPER + K", rofiDir .. "/keyhints", "Show all keybindings")

bind_exec("SUPER + P", scrDir .. "/screenshot", "Screenshot with editing")
bind_exec("SHIFT + PRINT", scrDir .. "/screenshot smart clipboard", "Screenshot to clipboard")

bind_exec("SUPER + R", scrDir .. "/screenrecord --with-desktop-audio", "Record Screen")
bind_exec("SUPER + SHIFT + R", scrDir .. "/screenrecord --with-microphone-audio", "Record + Mic")
bind_exec("SUPER + ALT + R", screenrecord .. " --with-desktop-audio --with-microphone-audio --with-webcam", "Record + Mic + Webcam")

bind_exec("SUPER + SHIFT + P", "pkill hyprpicker || hyprpicker -a", "Color picker")

bind_exec("SUPER + ALT + XF86AudioRaiseVolume", osdclient .. " --brightness raise", "Brightness up")
bind_exec("SUPER + ALT + XF86AudioLowerVolume", osdclient .. " --brightness lower", "Brightness down")

bind_exec("SUPER + XF86AudioRaiseVolume", "ddcutil setvcp 10 + 10", "Monitor Brightness up")
bind_exec("SUPER + XF86AudioLowerVolume", "ddcutil setvcp 10 - 10", "Monitor Brightness down")
bind_exec("SUPER + F1", scrDir .. "/toggle-monitor", "Toggle Monitor Power")
