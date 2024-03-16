{ config, pkgs, lib, inputs, ... }:

{
	home.packages = with pkgs; [
		# swww
		swaybg
		rofi-wayland
		kitty
		waybar
		dunst
		libnotify
		grim
		slurp
	];
	wayland.windowManager.hyprland = {
		enable = true;
		package = inputs.hyprland.packages."${pkgs.system}".hyprland;
		xwayland.enable = true;

		settings = {
			monitor = [
				"HDMI-A-2,preferred,auto,auto"
				"DP-2,preferred,auto,auto"
			];
			
			# Execute your favorite apps at launch
			# exec-once = waybar & hyprpaper & firefox
			
			"$terminal" = "kitty";
			"$fileManager" = "thunar";
			"$webBrowser" = "firefox";
			"$discord" = "vesktop";
			"$launcher" = "rofi -show drun -show-icons";
			
			env = [
				"XCURSOR_SIZE,24"
				"QT_QPA_PLATFORMTHEME,qt5ct" # change to qt6ct if you have that
			]; 
			
			input = {
			    kb_layout = "no";
			    kb_options = [
						"caps:super"
						# "shift:both_capslock" # doesn't work with multiple options set?
					];
			
			    follow_mouse = 1;
			
			    sensitivity = 0; 
			};
			
			general = {
			    gaps_in = 5;
			    gaps_out = 20;
			    border_size = 2;
					"col.active_border" = "rgba(${config.colorScheme.palette.base04}ee) rgba(${config.colorScheme.palette.base05}ee) 45deg";
			    "col.inactive_border" = "rgba(${config.colorScheme.palette.base00}aa)";
			    layout = "dwindle";
			    allow_tearing = false;
			};
			
			decoration = {
			    rounding = 10;
			
			#     blur = {
			#         enabled = true;
			#         size = 3;
			#         passes = 1;
			#         vibrancy = 0.1696;
			#     };
			blur.enabled = false;

			#     drop_shadow = true;
			#     shadow_range = 4;
			#     shadow_render_power = 3;
			#     "col.shadow" = "rgba(1a1a1aee)";
			drop_shadow = false;
			};
			
			# animations = {
			#     enabled = true;
			#     bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
			# 		animation = [
			# 			"windows, 1, 7, myBezier"
			#     	"windowsOut, 1, 7, default, popin 80%"
			#     	"border, 1, 10, default"
			#     	"borderangle, 1, 8, default"
			#     	"fade, 1, 7, default"
			#     	"workspaces, 1, 6, default"
			# 		];
			# };
			animations.enabled = false;
			
			dwindle = {
			    pseudotile = true; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
			    preserve_split = true;
			};
			
			master = {
			    new_is_master = true;
			};
			
			gestures = {
			    workspace_swipe = false;
			};
			
			misc = {
			    force_default_wallpaper = 0; # Set to 0 or 1 to disable the anime mascot wallpapers
			};
			
			# Example windowrule v1
			# windowrule = float, ^(kitty)$
			# Example windowrule v2
			# windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
			# windowrulev2 = suppressevent maximize, class:.* # You'll probably like this.
			
			"$mainMod" = "SUPER";
			
			bind = [
				"$mainMod, W, killactive,"
				"$mainMod, M, exit,"
				"$mainMod, V, togglefloating,"
				"$mainMod, P, pseudo," # dwindle
				"$mainMod, J, togglesplit," # dwindle

				# apps
				"$mainMod, SPACE, exec, $launcher"
				"$mainMod, E, exec, $fileManager"
				"$mainMod, T, exec, $terminal"
				"SHIFT_ALT, N, exec, $webBrowser"
				"SHIFT_ALT, M, exec, $discord"

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

				"$mainMod CTRL, 1, movetoworkspace, 1"
				"$mainMod CTRL, 2, movetoworkspace, 2"
				"$mainMod CTRL, 3, movetoworkspace, 3"
				"$mainMod CTRL, 4, movetoworkspace, 4"
				"$mainMod CTRL, 5, movetoworkspace, 5"
				"$mainMod CTRL, 6, movetoworkspace, 6"
				"$mainMod CTRL, 7, movetoworkspace, 7"
				"$mainMod CTRL, 8, movetoworkspace, 8"
				"$mainMod CTRL, 9, movetoworkspace, 9"
				"$mainMod CTRL, 0, movetoworkspace, 10"

				# Example special workspace (scratchpad)
				"$mainMod, S, togglespecialworkspace, magic"
				"$mainMod SHIFT, S, movetoworkspace, special:magic"

				# Scroll through existing workspaces with mainMod + scroll
				"$mainMod, mouse_down, workspace, e+1"
				"$mainMod, mouse_up, workspace, e-1"
			];
			
			bindm = [
				"bindm = $mainMod, mouse:272, movewindow"
				"bindm = $mainMod, mouse:273, resizewindow"
			];
		};
	};
}
