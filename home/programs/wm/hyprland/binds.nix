{ ... }:

{
	wayland.windowManager.hyprland.settings = {
		bind = [
			"SUPER, W, killactive,"
			"SUPER, V, togglefloating,"
			"SUPER, I, togglesplit,"

			# I am weird so i switch between left and right_handed
			''CTRL SHIFT, L, exec, if [[ $(hyprctl getoption input:left_handed) == *"0"* ]]; then hyprctl keyword input:left_handed 1; else hyprctl keyword input:left_handed 0; fi''

			", F11, fullscreen, 0"
			"SHIFT, F11, fullscreen, 1"
			"SUPER, F11, fullscreen, 2"
			", F12, fakefullscreen"

			"SUPER, h, movefocus, l"
			"SUPER, j, movefocus, d"
			"SUPER, k, movefocus, u"
			"SUPER, l, movefocus, r"

			"SUPER CONTROL, h, swapwindow, l"
			"SUPER CONTROL, j, swapwindow, d"
			"SUPER CONTROL, k, swapwindow, u"
			"SUPER CONTROL, l, swapwindow, r"
		];

		# l -> works even when locked
		# e -> repeats when key is held 
		binde = [
			"SUPER ALT, h, resizeactive, -10 0"
			"SUPER ALT, j, resizeactive, 0 -10"
			"SUPER ALT, k, resizeactive, 0 10"
			"SUPER ALT, l, resizeactive, 10 0"
		];
		
		bindm = [
			"SUPER, mouse:272, movewindow"
			"SUPER, mouse:273, resizewindow"
		];
	};
}
