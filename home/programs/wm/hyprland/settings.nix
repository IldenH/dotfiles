{ config, ... }:

{
	wayland.windowManager.hyprland.settings = {
		monitor = [
			"HDMI-A-2,preferred,auto,auto"
			"DP-2,preferred,auto,auto"
		];
		
		exec-once = "waybar";
		
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
		
		    follow_mouse = 2;
		
		    sensitivity = 0.7; 
				accel_profile = "flat";
		};
		
		general = {
		    gaps_in = 2;
		    gaps_out = 2;
		    border_size = 2;
				"col.active_border" = "rgba(${config.colorScheme.palette.base02}ee) rgba(${config.colorScheme.palette.base03}ee) 45deg";
		    "col.inactive_border" = "rgba(${config.colorScheme.palette.base00}aa)";
		    layout = "dwindle";
		    allow_tearing = false;
		};
		
		decoration = {
			rounding = 5;
			blur.enabled = false;
			drop_shadow = false;
		};
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
		    force_default_wallpaper = 1; # Set to 0 or 1 to disable the anime mascot wallpapers
		};
		
		# Example windowrule v1
		# windowrule = float, ^(kitty)$
		# Example windowrule v2
		# windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
		# windowrulev2 = suppressevent maximize, class:.* # You'll probably like this.
	};
}
