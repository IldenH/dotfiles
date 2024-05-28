{...}: {
  # TODO: Make options for this and if multiple monitors, then many workspaces
  wayland.windowManager.hyprland.settings = {
    workspace = [
      "1, monitor:HDMI-A-2, default:true"
      "2, monitor:HDMI-A-2"
      "3, monitor:HDMI-A-2"
      "4, monitor:HDMI-A-2"
      "5, monitor:HDMI-A-2"

      "11, monitor:DP-2, default:true"
      "12, monitor:DP-2"
      "13, monitor:DP-2"
      "14, monitor:DP-2"
      "15, monitor:DP-2"
    ];

    bind = [
      "SUPER, 1, workspace, 1"
      "SUPER, 2, workspace, 2"
      "SUPER, 3, workspace, 3"
      "SUPER, 4, workspace, 4"
      "SUPER, 5, workspace, 5"

      "SUPER, F1, workspace, 11"
      "SUPER, F2, workspace, 12"
      "SUPER, F3, workspace, 13"
      "SUPER, F4, workspace, 14"
      "SUPER, F5, workspace, 15"

      "SUPER ALT, 1, movetoworkspace, 1"
      "SUPER ALT, 2, movetoworkspace, 2"
      "SUPER ALT, 3, movetoworkspace, 3"
      "SUPER ALT, 4, movetoworkspace, 4"
      "SUPER ALT, 5, movetoworkspace, 5"

      "SUPER ALT, F1, movetoworkspace, 11"
      "SUPER ALT, F2, movetoworkspace, 12"
      "SUPER ALT, F3, movetoworkspace, 13"
      "SUPER ALT, F4, movetoworkspace, 14"
      "SUPER ALT, F5, movetoworkspace, 15"
    ];
  };
}
