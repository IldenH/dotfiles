{...}: {
  wayland.windowManager.hyprland.settings = {
    "$terminal" = "kitty";
    "$files" = "nemo";
    "$browser" = "firefox";
    "$launcher" = "rofi -show drun -show-icons";
    "$discord" = "vesktop --enable-wayland-ime";
    "$anki" = "QT_IM_MODULE=fcitx anki";
    "$calculator" = "bash -c 'pgrep qalculate-gtk && hyprctl dispatch togglespecialworkspace calculator || qalculate-gtk &'";

    bind = [
      "SUPER, SPACE, exec, $launcher"
      "SUPER, E, exec, $files"
      "SUPER, T, exec, $terminal"
      "SUPER, P, exec, hyprlock"

      "SUPER, M, exec, [workspace 13] $discord"
      "SUPER ALT, M, exec, [workspace 4] steam"

      "SUPER, B, exec, [workspace 3] $anki"

      "SUPER, X, exec, [workspace 4] heroic"
      "SUPER ALT, X, exec, [workspace 4] prismlauncher"

      "SUPER, G, exec, $calculator"
      "SUPER ALT, G, exec, geogebra"
      "SUPER ALT CTRL, G, exec, krita"

      # browser
      "SUPER, N, exec, [workspace 2] $browser -P main"
      "SUPER ALT, N, exec, [workspace 4] $browser -P school"
      "SUPER, Y, exec, [workspace 4] $browser -P math"
      "SUPER ALT, Y, exec, [workspace 4] $browser -P math https://skole.digilaer.no/auth/saml/index.php?wantsurl=https%3A%2F%2Fskole.digilaer.no%2Fmod%2Fadobeconnect%2Fview.php%3Fid%3D13352"
    ];
  };
}
