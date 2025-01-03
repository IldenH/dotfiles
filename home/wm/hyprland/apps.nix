_: {
  wayland.windowManager.hyprland.settings = {
    "$terminal" = "kitty";
    "$files" = "nemo";
    "$browser" = "firefox";
    "$launcher" = "rofi -show drun -show-icons";
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
      "SUPER ALT, M, exec, steam"

      "SUPER, B, exec, [workspace 3] $anki"

      "SUPER, X, exec, heroic"
      "SUPER ALT, X, exec, prismlauncher"

      "SUPER, G, exec, $calculator"
      "SUPER ALT, G, exec, geogebra"
      "SUPER ALT CTRL, G, exec, krita"

      "SUPER ALT, R, exec, $screenrec"

      # browser
      "SUPER, N, exec, [workspace 2] $browser -P main --name main"
      "SUPER ALT, N, exec, [workspace 4] $browser -P school --name school"
      "SUPER, Y, exec, [workspace 4] $browser -P math --name math"
      "SUPER ALT, Y, exec, [workspace 4] $browser -P math https://skole.digilaer.no/auth/saml/index.php?wantsurl=https%3A%2F%2Fskole.digilaer.no%2Fmod%2Fadobeconnect%2Fview.php%3Fid%3D13352 --name math"
    ];
  };
}
