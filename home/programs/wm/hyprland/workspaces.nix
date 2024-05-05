{ ... }:

{
	# TODO: Make options for this and if multiple monitors, then many workspaces
	wayland.windowManager.hyprland.settings =  {
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
			", F1, workspace, 1"
			", F2, workspace, 2"
			", F3, workspace, 3"
			", F4, workspace, 4"
			", F5, workspace, 5"

			"SHIFT, F1, workspace, 11"
			"SHIFT, F2, workspace, 12"
			"SHIFT, F3, workspace, 13"
			"SHIFT, F4, workspace, 14"
			"SHIFT, F5, workspace, 15"

			"SUPER, F1, workspace, 11"
			"SUPER, F2, workspace, 12"
			"SUPER, F3, workspace, 13"
			"SUPER, F4, workspace, 14"
			"SUPER, F5, workspace, 15"

			"CTRL, F1, movetoworkspace, 1"
			"CTRL, F2, movetoworkspace, 2"
			"CTRL, F3, movetoworkspace, 3"
			"CTRL, F4, movetoworkspace, 4"
			"CTRL, F5, movetoworkspace, 5"

			"ALT, F1, movetoworkspace, 1"
			"ALT, F2, movetoworkspace, 2"
			"ALT, F3, movetoworkspace, 3"
			"ALT, F4, movetoworkspace, 4"
			"ALT, F5, movetoworkspace, 5"

			"CTRL SHIFT, F1, movetoworkspace, 11"
			"CTRL SHIFT, F2, movetoworkspace, 12"
			"CTRL SHIFT, F3, movetoworkspace, 13"
			"CTRL SHIFT, F4, movetoworkspace, 14"
			"CTRL SHIFT, F5, movetoworkspace, 15"

			"ALT SUPER, F1, movetoworkspace, 11"
			"ALT SUPER, F2, movetoworkspace, 12"
			"ALT SUPER, F3, movetoworkspace, 13"
			"ALT SUPER, F4, movetoworkspace, 14"
			"ALT SUPER, F5, movetoworkspace, 15"
		];
	};
}
