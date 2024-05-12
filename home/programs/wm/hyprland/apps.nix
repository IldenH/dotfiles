{...}: {
  wayland.windowManager.hyprland.settings = {
    "$terminal" = "kitty";
    "$files" = "nemo";
    "$browser" = "firefox";
    "$launcher" = "rofi -show drun -show-icons";
    "$discord" = "vesktop --enable-wayland-ime";
    "$anki" = "QT_IM_MODULE=fcitx anki";

    bind = [
      "SUPER, SPACE, exec, $launcher"
      "SUPER, E, exec, $files"
      "SUPER, T, exec, $terminal"

      "SUPER, M, exec, $discord"
      "SUPER ALT, M, exec, steam"

      "SUPER, B, exec, $anki"

      "SUPER, X, exec, heroic"
      "SUPER ALT, X, exec, prismlauncher"

      "SUPER, G, exec, bash -c 'pgrep qalculate-gtk && hyprctl dispatch togglespecialworkspace calculator || qalculate-gtk &'"
      "SUPER ALT, G, exec, geogebra"
      "SUPER ALT CTRL, G, exec, krita"

      # browser
      "SUPER, N, exec, $browser -P main"
      "SUPER ALT, N, exec, $browser -P school"
      "SUPER, Y, exec, $browser -P math"
      "SUPER ALT, Y, exec, $browser -P math https://skole.digilaer.no/auth/saml/index.php?wantsurl=https%3A%2F%2Fskole.digilaer.no%2Fmod%2Fadobeconnect%2Fview.php%3Fid%3D13352"
    ];
  };
}
