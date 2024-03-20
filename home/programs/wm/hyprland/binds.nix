{ ... }:

{
	wayland.windowManager.hyprland.settings = {
			"$mainMod" = "SUPER";
			
			bind = [
				"$mainMod, W, killactive,"
				"$mainMod, M, exit,"
				"$mainMod, V, togglefloating,"
				"$mainMod, P, pseudo," # dwindle
				"$mainMod, J, togglesplit," # dwindle

				# Move focus with mainMod + arrow keys
				"$mainMod, left, movefocus, l"
				"$mainMod, right, movefocus, r"
				"$mainMod, up, movefocus, u"
				"$mainMod, down, movefocus, d"

				"CTRL, F1, workspace, 1"
				"CTRL, F2, workspace, 2"
				"CTRL, F3, workspace, 3"
				"CTRL, F4, workspace, 4"
				"CTRL, F5, workspace, 5"
				"CTRL, F6, workspace, 6"
				"CTRL, F7, workspace, 7"
				"CTRL, F8, workspace, 8"
				"CTRL, F9, workspace, 9"
				"CTRL, F0, workspace, 10"

				"$mainMod CTRL, F1, movetoworkspace, 1"
				"$mainMod CTRL, F2, movetoworkspace, 2"
				"$mainMod CTRL, F3, movetoworkspace, 3"
				"$mainMod CTRL, F4, movetoworkspace, 4"
				"$mainMod CTRL, F5, movetoworkspace, 5"
				"$mainMod CTRL, F6, movetoworkspace, 6"
				"$mainMod CTRL, F7, movetoworkspace, 7"
				"$mainMod CTRL, F8, movetoworkspace, 8"
				"$mainMod CTRL, F9, movetoworkspace, 9"
				"$mainMod CTRL, F0, movetoworkspace, 10"

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
