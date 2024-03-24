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

			", F11, fullscreen, 0"
			"SHIFT, F11, fullscreen, 1"
			"$mainMod, F11, fullscreen, 2"
			", F12, fakefullscreen"

			"$mainMod, h, movefocus, l"
			"$mainMod, j, movefocus, d"
			"$mainMod, k, movefocus, u"
			"$mainMod, l, movefocus, r"

			"$mainMod CONTROL, h, swapwindow, l"
			"$mainMod CONTROL, j, swapwindow, d"
			"$mainMod CONTROL, k, swapwindow, u"
			"$mainMod CONTROL, l, swapwindow, r"

			# Example special workspace (scratchpad)
			# "$mainMod, S, togglespecialworkspace, magic"
			# "$mainMod SHIFT, S, movetoworkspace, special:magic"

			# Scroll through existing workspaces with mainMod + scroll
			"$mainMod, mouse_down, workspace, e+1"
			"$mainMod, mouse_up, workspace, e-1"
		];

		# l -> works even when locked
		# e -> repeats when key is held 
		binde = [
			"$mainMod ALT, h, resizeactive, -10 0"
			"$mainMod ALT, j, resizeactive, 0 -10"
			"$mainMod ALT, k, resizeactive, 0 10"
			"$mainMod ALT, l, resizeactive, 10 0"
		];
		
		bindm = [
			"$mainMod, mouse:272, movewindow"
			"$mainMod, mouse:273, resizewindow"
		];
	};
}
