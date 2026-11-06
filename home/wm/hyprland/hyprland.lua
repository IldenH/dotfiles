hl.monitor({
  output = "",
  mode = "preferred",
  position = "auto",
  scale = "auto",
})

require("./monitors.lua")
require("./screenshots.lua")

hl.on("hyprland.start", function()
  hl.exec_cmd("dbus-update-activation-environment --systemd --all && systemctl --user stop hyprland-session.target && systemctl --user start hyprland-session.target")
  hl.exec_cmd("swaybg -i " .. wallpaper)
  hl.exec_cmd("waybar")
  hl.exec_cmd("fcitx5")
end)

hl.on("hyprland.shutdown", function()
  hl.exec_cmd("systemctl --user stop hyprland-session.target")
end)

hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

hl.config({
  general = {
    gaps_in = 0,
    gaps_out = 0,
    border_size = 1,

    col = {
      active_border = { colors = active_border_colors, angle = 45 },
      inactive_border = inactive_border,
    },

    allow_tearing = true,
    layout = "dwindle",
  },

  decoration = {
    rounding = 5,

    shadow = {
      enabled = false,
    },

    blur = {
      enabled = false,
    },
  },

  animations = {
    enabled = false,
  },

  input = {
    kb_layout = "no",
    kb_options = "caps:super",
    touchpad = { natural_scroll = true },
    follow_mouse = 2,
    sensitivity = 0.700000,
    accel_profile = "flat",
  },

  cursor = {
    hide_on_key_press = true,
    inactive_timeout = 1,
  },

  dwindle = {
    preserve_split = true,
  },

  ecosystem = {
    no_donation_nag = true,
    no_update_news = true,
  },

  misc = {
    force_default_wallpaper = 1,
  },
})

-- Workspace monitors
hl.workspace_rule({ workspace = "1", monitor = monitors[1], default = true })
hl.workspace_rule({ workspace = "2", monitor = monitors[1] })
hl.workspace_rule({ workspace = "3", monitor = monitors[1] })
hl.workspace_rule({ workspace = "4", monitor = monitors[1] })
hl.workspace_rule({ workspace = "5", monitor = monitors[1] })
hl.workspace_rule({ workspace = "11", monitor = monitors[2], default = true })
hl.workspace_rule({ workspace = "12", monitor = monitors[2] })
hl.workspace_rule({ workspace = "13", monitor = monitors[2] })
hl.workspace_rule({ workspace = "14", monitor = monitors[2] })
hl.workspace_rule({ workspace = "15", monitor = monitors[2] })

-- Window rules
hl.window_rule({ match = { class = "vesktop" }, workspace = 13 })
hl.window_rule({ match = { class = "steam" }, workspace = 4 })
hl.window_rule({ match = { class = "heroic" }, workspace = 4 })
hl.window_rule({ match = { class = "org.prismlauncher.PrismLauncher" }, workspace = 4 })
hl.window_rule({ match = { class = "teams-for-linux" }, workspace = 4 })
hl.window_rule({
  match = { class = "Anki", title = "Statistics|統計|Preferences|設定|Options|オプション" },
  center = true,
  size = { "70%", "80%" },
  float = true,
})
hl.window_rule({ match = { class = "qalculate-gtk" }, float = true })
hl.window_rule({ match = { class = "qalculate-gtk" }, workspace = "special:calculator" })

-- Workspace switching
hl.bind("SUPER + Tab", hl.dsp.focus({ workspace = "previous" }))
hl.bind("SUPER + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind("SUPER + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind("SUPER + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind("SUPER + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind("SUPER + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind("SUPER + F1", hl.dsp.focus({ workspace = 11 }))
hl.bind("SUPER + F2", hl.dsp.focus({ workspace = 12 }))
hl.bind("SUPER + F3", hl.dsp.focus({ workspace = 13 }))
hl.bind("SUPER + F4", hl.dsp.focus({ workspace = 14 }))
hl.bind("SUPER + F5", hl.dsp.focus({ workspace = 15 }))

-- Move window to workspace
hl.bind("SUPER + ALT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind("SUPER + ALT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind("SUPER + ALT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind("SUPER + ALT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind("SUPER + ALT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind("SUPER + ALT + F1", hl.dsp.window.move({ workspace = 11 }))
hl.bind("SUPER + ALT + F2", hl.dsp.window.move({ workspace = 12 }))
hl.bind("SUPER + ALT + F3", hl.dsp.window.move({ workspace = 13 }))
hl.bind("SUPER + ALT + F4", hl.dsp.window.move({ workspace = 14 }))
hl.bind("SUPER + ALT + F5", hl.dsp.window.move({ workspace = 15 }))

-- Window management & focus
hl.bind("SUPER + W", hl.dsp.window.close())
hl.bind("SUPER + I", hl.dsp.layout("togglesplit"))
hl.bind("SUPER + ALT + I", hl.dsp.window.float({ action = "toggle" }))
hl.bind("CTRL + SHIFT + L", hl.dsp.exec_cmd(swapMouse))
hl.bind("F11", hl.dsp.window.fullscreen({ mode = 0 }))
hl.bind("SHIFT + F11", hl.dsp.window.fullscreen({ mode = 1 }))
hl.bind("F12", hl.dsp.window.fullscreen_state({ internal = 0, client = 3 }))
hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + U", hl.dsp.window.swap({ next = true }))
hl.bind("ALT + C", hl.dsp.exec_cmd("echo"))

-- Applications
hl.bind("SUPER + SPACE", hl.dsp.exec_cmd(launcher))
hl.bind("SUPER + E", hl.dsp.exec_cmd(files))
hl.bind("SUPER + T", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + P", hl.dsp.exec_cmd("hyprlock"))
hl.bind("SUPER + M", hl.dsp.exec_cmd(discord))
hl.bind("SUPER + B", hl.dsp.exec_cmd("[workspace 3] anki"))
hl.bind("SUPER + G", hl.dsp.exec_cmd(calculator))
hl.bind("SUPER + ALT + R", hl.dsp.exec_cmd(screenrec))
hl.bind("SUPER + N", hl.dsp.exec_cmd("[workspace 2] " .. browser .. " -P main --name main"))
hl.bind("SUPER + ALT + N", hl.dsp.exec_cmd("[workspace 12] " .. browser .. " -P school --name school"))

-- Mouse Binds
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Submap: Resize Mode
hl.bind("SUPER + R", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
  hl.bind("H", hl.dsp.window.resize({ x = -50, y = 0, relative = true }), { repeating = true })
  hl.bind("J", hl.dsp.window.resize({ x = 0, y = 50, relative = true }), { repeating = true })
  hl.bind("K", hl.dsp.window.resize({ x = 0, y = -50, relative = true }), { repeating = true })
  hl.bind("L", hl.dsp.window.resize({ x = 50, y = 0, relative = true }), { repeating = true })
  hl.bind("catchall", hl.dsp.submap("reset"))
end)
