{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    monitor = [
      # fallback
      ", preferred, auto, auto"
    ];

    # nwg-displays
    source = [
      "~/.config/hypr/monitors.conf"
    ];

    exec-once = [
      "swaybg -i ${config.settings.wallpaper}"
      "waybar"
      "fcitx5"
    ];

    env = [
      "QT_QPA_PLATFORMTHEME, qt5ct" # change to qt6ct if you have that
    ];

    input = {
      kb_layout = "no";
      kb_options = [
        "caps:super"
        # "shift:both_capslock" # doesn't work with multiple options set?
      ];

      follow_mouse = 2;

      sensitivity = 0.7;
      accel_profile = "flat";
    };

    general = {
      gaps_in = 0;
      gaps_out = 0;
      border_size = 1;
      "col.active_border" = "rgba(${config.colorScheme.palette.base02}ee) rgba(${config.colorScheme.palette.base03}ee) 45deg";
      "col.inactive_border" = "rgba(${config.colorScheme.palette.base00}aa)";
      layout = "dwindle";
      allow_tearing = true;
      cursor_inactive_timeout = 1;
    };

    decoration = {
      rounding = 5;
      # dim_inactive = 1;
      # dim_strength = 0.05;
      blur.enabled = false;
      drop_shadow = false;
    };

    animations.enabled = false;

    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };

    master = {
      new_is_master = true;
    };

    misc = {
      force_default_wallpaper = 1;
    };
  };
}
