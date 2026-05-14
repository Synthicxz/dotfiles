-- Visual settings from looknfeel.conf.

local colors = require("lua.colors")

hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 12,
    border_size = 2,
    col = {
      active_border = colors.active_border,
      inactive_border = colors.inactive_border,
    },
    resize_on_border = true,
    layout = "dwindle",
  },
  decoration = {
    rounding = 10,
    blur = {
      enabled = true,
      size = 7,
      passes = 4,
      ignore_opacity = true,
      noise = 0.0117,
      contrast = 0.8916,
      brightness = 0.8172,
      xray = false,
      popups = true,
    },
  },
  misc = {
    disable_hyprland_logo = true,
    disable_splash_rendering = true,
    focus_on_activate = true,
    anr_missed_pings = 3,
    on_focus_under_fullscreen = 1,
  },
})

-- Layer rules: app launchers, bars, OSD, notifications.
hl.layer_rule({ match = { namespace = "rofi" }, blur = true })
hl.layer_rule({ match = { namespace = "rofi" }, ignore_alpha = 0 })
hl.layer_rule({ match = { namespace = "rofi" }, animation = "slide bottom" })

hl.layer_rule({ match = { namespace = "waybar" }, blur = true })
hl.layer_rule({ match = { namespace = "waybar" }, ignore_alpha = 0 })

hl.layer_rule({ match = { namespace = "swayosd" }, blur = true })
hl.layer_rule({ match = { namespace = "swayosd" }, ignore_alpha = 0 })

hl.layer_rule({ match = { namespace = "swaync-control-center" }, blur = true })
hl.layer_rule({ match = { namespace = "swaync-notification-window" }, blur = true })
hl.layer_rule({ match = { namespace = "swaync-control-center" }, ignore_alpha = 0 })
hl.layer_rule({ match = { namespace = "swaync-notification-window" }, ignore_alpha = 0 })
hl.layer_rule({ match = { namespace = "swaync-control-center" }, ignore_alpha = 0.5 })
hl.layer_rule({ match = { namespace = "swaync-notification-window" }, ignore_alpha = 0.5 })
hl.layer_rule({ match = { namespace = "swaync-control-center" }, animation = "slide right" })
