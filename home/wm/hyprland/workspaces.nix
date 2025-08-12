_: {
  # TODO: Make options for this and if multiple monitors, then many workspaces
  wayland.windowManager.hyprland.settings = {
    workspace = let
      monitors = ["desc:Samsung Electric Company S24F350 H4ZJ701847" "desc:Samsung Electric Company S24F350 H4ZMA03168"];
    in [
      "1, monitor:${builtins.elemAt monitors 0}, default:true"
      "2, monitor:${builtins.elemAt monitors 0}"
      "3, monitor:${builtins.elemAt monitors 0}"
      "4, monitor:${builtins.elemAt monitors 0}"
      "5, monitor:${builtins.elemAt monitors 0}"

      "11, monitor:${builtins.elemAt monitors 1}, default:true"
      "12, monitor:${builtins.elemAt monitors 1}"
      "13, monitor:${builtins.elemAt monitors 1}"
      "14, monitor:${builtins.elemAt monitors 1}"
      "15, monitor:${builtins.elemAt monitors 1}"
    ];

    bind = [
      "SUPER, Tab, workspace, previous"

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
