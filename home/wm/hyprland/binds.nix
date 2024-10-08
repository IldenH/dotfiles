{
  wayland.windowManager.hyprland.settings = {
    "$swapMouse" = ''if [[ $(hyprctl getoption input:left_handed) == *"0"* ]]; then hyprctl keyword input:left_handed 1; else hyprctl keyword input:left_handed 0; fi'';

    bind = [
      "SUPER, W, killactive,"
      "SUPER, I, togglesplit,"
      "SUPER ALT, I, togglefloating,"

      # I am weird so i switch between left and right_handed
      "CTRL SHIFT, L, exec, $swapMouse"

      ", F11, fullscreen, 0"
      "SHIFT, F11, fullscreen, 1"
      ", F12, fullscreenstate, 0 3"

      "SUPER, H, movefocus, l"
      "SUPER, J, movefocus, d"
      "SUPER, K, movefocus, u"
      "SUPER, L, movefocus, r"

      "SUPER, U, swapnext"
      "SUPER, R, swapnext"

      "ALT, C, exec, echo" # disable cstimer bind
    ];

    # e -> repeats when key is held
    binde = [
      "SUPER ALT, H, resizeactive, -10 0"
      "SUPER ALT, J, resizeactive, 0 10"
      "SUPER ALT, K, resizeactive, 0 -10"
      "SUPER ALT, L, resizeactive, 10 0"
    ];

    bindm = [
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
    ];
  };
}
