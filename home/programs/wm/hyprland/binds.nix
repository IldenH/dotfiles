{ ... }:

{
	wayland.windowManager.hyprland.settings = {
			"$mainMod" = "SUPER";
			
			bind = [
				"$mainMod, W, killactive,"
				"$mainMod, M, exit,"
				"$mainMod, V, togglefloating,"
				"$mainMod, P, pseudo," # dwindle
				"$mainMod, I, togglesplit," # dwindle

				"$mainMod, h, movefocus, l"
				"$mainMod, j, movefocus, d"
				"$mainMod, k, movefocus, u"
				"$mainMod, l, movefocus, r"

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

				# Example special workspace (scratchpad)
				# "$mainMod, S, togglespecialworkspace, magic"
				# "$mainMod SHIFT, S, movetoworkspace, special:magic"

				# Scroll through existing workspaces with mainMod + scroll
				"$mainMod, mouse_down, workspace, e+1"
				"$mainMod, mouse_up, workspace, e-1"
			];
			
			bindm = [
				"bindm = $mainMod, mouse:272, movewindow"
				"bindm = $mainMod, mouse:273, resizewindow"
			];
	};
}
