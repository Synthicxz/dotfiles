-- Window and layer rules from monitors.conf + windowsrules.conf.
-- Rules are order-sensitive, so keep broad rules above/below specific ones as they were.

-- Workspace -> app assignment from monitors.conf.
hl.window_rule({ match = { class = "(dev.zed.Zed)" }, workspace = "2" })
hl.window_rule({ match = { class = "^(brave-perplexity.ai__-Default)$" }, workspace = "3" })
hl.window_rule({ match = { class = "^(brave-web.whatsapp.com__-Default)$" }, workspace = "5" })
hl.window_rule({ match = { class = "(org.telegram.desktop)" }, workspace = "6" })
hl.window_rule({ match = { class = "^(brave-app.todoist.com__-Default)$" }, workspace = "7" })
hl.window_rule({ match = { class = "(obsidian)" }, workspace = "8" })
hl.window_rule({ match = { class = "(spotify)" }, workspace = "9" })
hl.window_rule({ match = { class = "(vesktop)" }, workspace = "10" })

-- Fix some dragging issues with XWayland.
hl.window_rule({
  match = { class = "^$", title = "^$", xwayland = true, float = false, fullscreen = false, pin = false },
  no_focus = true,
})

-- Prevent apps from auto-maximizing themselves.
hl.window_rule({ match = { class = ".*" }, suppress_event = "maximize" })

-- 97% opacity when focused, 90% when unfocused.
hl.window_rule({ match = { class = ".*" }, opacity = "0.97 0.9" })

-- Layer rule from windowsrules.conf.
hl.layer_rule({ match = { namespace = "selection" }, animation = "none" })

-- Floating windows.
hl.window_rule({ match = { tag = "floating-window" }, float = true })
hl.window_rule({ match = { tag = "floating-window" }, center = true })
hl.window_rule({ match = { tag = "floating-window" }, size = { 610, 500 } })

hl.window_rule({ match = { class = "(blueman-manager|localsend|Wiremix|nmgui)" }, tag = "+floating-window" })
hl.window_rule({ match = { title = "^(.*Network Manager.*)$" }, tag = "+floating-window" })
hl.window_rule({ match = { title = "(webapp-install|share)" }, tag = "+floating-window" })
hl.window_rule({
  match = {
    class = "(xdg-desktop-portal-gtk)",
    title = "^(Open.*Files?|Open [F|f]older.*|Save.*Files?|Save.*As|Save|All Files|.*wants to [open|save].*|[C|c]hoose.*)",
  },
  tag = "+floating-window",
})

-- Symphony TUI.
hl.window_rule({ match = { title = "symphony-tui" }, float = true })
hl.window_rule({ match = { title = "symphony-tui" }, center = true })
hl.window_rule({ match = { title = "symphony-tui" }, size = { 720, 580 } })

-- Symphony Browse.
hl.window_rule({ match = { title = "symphony-browse" }, float = true })
hl.window_rule({ match = { title = "symphony-browse" }, center = true })
hl.window_rule({ match = { title = "symphony-browse" }, size = { 1200, 750 } })

-- Easyeffects.
hl.window_rule({ match = { class = "com.github.wwmm.easyeffects" }, float = true })
hl.window_rule({ match = { class = "com.github.wwmm.easyeffects" }, center = true })
hl.window_rule({ match = { class = "com.github.wwmm.easyeffects" }, size = { 950, 850 } })

-- Steam.
hl.window_rule({ match = { class = "steam" }, float = true })
hl.window_rule({ match = { class = "steam", title = "Steam" }, center = true })
hl.window_rule({ match = { class = "steam" }, opacity = "1 1" })
hl.window_rule({ match = { class = "steam", title = "Steam" }, size = { 1100, 700 } })
hl.window_rule({ match = { class = "steam", title = "Friends List" }, size = { 460, 800 } })
hl.window_rule({ match = { class = "steam" }, idle_inhibit = "fullscreen" })

-- Screensaver.
hl.window_rule({ match = { class = "Screensaver" }, fullscreen = true })
hl.window_rule({ match = { class = "Screensaver" }, float = true })
hl.window_rule({ match = { class = "Screensaver" }, center = true })

-- Hide Bitwarden from screen share.
hl.window_rule({ match = { class = "^(Bitwarden)$" }, no_screen_share = true })

-- Browser types.
hl.window_rule({ match = { class = "((google-)?[cC]hrom(e|ium)|[bB]rave-browser|[mM]icrosoft-edge|Vivaldi-stable|helium)" }, tag = "+chromium-based-browser" })
hl.window_rule({ match = { class = "([fF]irefox|zen|librewolf)" }, tag = "+firefox-based-browser" })

-- Force chromium-based browsers into a tile to deal with --app bug.
hl.window_rule({ match = { tag = "chromium-based-browser" }, tile = true })

-- Only a subtle opacity change, but not for video sites.
hl.window_rule({ match = { tag = "chromium-based-browser" }, opacity = "1 0.97" })
hl.window_rule({ match = { tag = "firefox-based-browser" }, opacity = "1 0.97" })

-- Some video sites should never have opacity applied.
hl.window_rule({ match = { initial_title = [=[((?i)(?:[a-z0-9-]+\.)*youtube\.com_/|app\.zoom\.us_/wc/home)]=] }, opacity = "1.0 1.0" })

-- Webcam overlay for screen recording.
hl.window_rule({ match = { title = "WebcamOverlay" }, float = true })
hl.window_rule({ match = { title = "WebcamOverlay" }, pin = true })
hl.window_rule({ match = { title = "WebcamOverlay" }, no_initial_focus = true })
hl.window_rule({ match = { title = "WebcamOverlay" }, no_dim = true })
hl.window_rule({ match = { title = "WebcamOverlay" }, move = { "100%-w-40", "100%-w-40" } })

-- Picture-in-picture overlays.
hl.window_rule({ match = { title = "(Picture.?in.?[Pp]icture)" }, tag = "+pip" })
hl.window_rule({ match = { tag = "pip" }, float = true })
hl.window_rule({ match = { tag = "pip" }, pin = true })
hl.window_rule({ match = { tag = "pip" }, size = { 600, 338 } })
hl.window_rule({ match = { tag = "pip" }, keep_aspect_ratio = true })
hl.window_rule({ match = { tag = "pip" }, border_size = 0 })
hl.window_rule({ match = { tag = "pip" }, opacity = "1 1" })
hl.window_rule({ match = { tag = "pip" }, move = { "100%-w-40", "4%" } })
