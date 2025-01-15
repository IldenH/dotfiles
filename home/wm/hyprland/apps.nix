_: {
  wayland.windowManager.hyprland.settings = {
    "$terminal" = "kitty";
    "$files" = "nemo";
    "$browser" = "firefox";
    "$launcher" = "rofi -show drun";
    "$discord" = "vesktop";
    "$anki" = "QT_IM_MODULE=fcitx anki";
    "$calculator" = "bash -c 'pgrep qalculate-gtk && hyprctl dispatch togglespecialworkspace calculator || qalculate-gtk &'";
    "$screenrec" = "wl-screenrec-daemon --toggle";

    bind = [
      "SUPER, SPACE, exec, $launcher"
      "SUPER, E, exec, $files"
      "SUPER, T, exec, $terminal"
      "SUPER, P, exec, hyprlock"

      "SUPER, M, exec, $discord"

      "SUPER, B, exec, [workspace 3] $anki"

      "SUPER, X, exec, heroic"
      "SUPER ALT, X, exec, prismlauncher"

      "SUPER, G, exec, $calculator"

      "SUPER ALT, R, exec, $screenrec"

      # browser
      "SUPER, N, exec, [workspace 2] $browser -P main --name main"
      "SUPER ALT, N, exec, [workspace 12] $browser -P school --name school"
    ];
  };
}
