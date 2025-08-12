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

      "ALT, C, exec, echo" # disable cstimer bind
    ];

    bindm = [
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
    ];
  };
  wayland.windowManager.hyprland.extraConfig = ''
    bind = SUPER, R, submap, resize
    submap = resize
    binde = , H, resizeactive, -50 0
    binde = , J, resizeactive, 0 50
    binde = , K, resizeactive, 0 -50
    binde = , L, resizeactive, 50 0
    bind = , catchall, submap, reset
    submap = reset
  '';
}
