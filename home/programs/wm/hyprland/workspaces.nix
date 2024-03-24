{ ... }:

{
	# TODO: Make options for this and if multiple monitors, then many workspaces
	wayland.windowManager.hyprland.settings =  {
		workspace = [
			"HDMI-A-2, 1"
			"DP-2, 11"

			"1, monitor:HDMI-A-2"
			"2, monitor:HDMI-A-2"
			"3, monitor:HDMI-A-2"
			"4, monitor:HDMI-A-2"
			"5, monitor:HDMI-A-2"

			"11, monitor:DP-2"
			"12, monitor:DP-2"
			"13, monitor:DP-2"
			"14, monitor:DP-2"
			"15, monitor:DP-2"
		];

		bind = [
			"CTRL, F1, workspace, 1"
			"CTRL, F2, workspace, 2"
			"CTRL, F3, workspace, 3"
			"CTRL, F4, workspace, 4"
			"CTRL, F5, workspace, 5"

			"CTRL SHIFT, F1, workspace, 11"
			"CTRL SHIFT, F2, workspace, 12"
			"CTRL SHIFT, F3, workspace, 13"
			"CTRL SHIFT, F4, workspace, 14"
			"CTRL SHIFT, F5, workspace, 15"

			"$mainMod CTRL, F1, movetoworkspace, 1"
			"$mainMod CTRL, F2, movetoworkspace, 2"
			"$mainMod CTRL, F3, movetoworkspace, 3"
			"$mainMod CTRL, F4, movetoworkspace, 4"
			"$mainMod CTRL, F5, movetoworkspace, 5"

			"$mainMod CTRL SHIFT, F1, movetoworkspace, 11"
			"$mainMod CTRL SHIFT, F2, movetoworkspace, 12"
			"$mainMod CTRL SHIFT, F3, movetoworkspace, 13"
			"$mainMod CTRL SHIFT, F4, movetoworkspace, 14"
			"$mainMod CTRL SHIFT, F5, movetoworkspace, 15"
		];
	};
}
