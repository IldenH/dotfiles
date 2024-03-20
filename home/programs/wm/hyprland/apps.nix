{ ... }:

{
	wayland.windowManager.hyprland.settings = {
		"$terminal" = "kitty";
		"$fileManager" = "thunar";
		"$webBrowser" = "firefox";
		"$discord" = "vesktop";
		"$launcher" = "rofi -show drun -show-icons";

		bind = [
			"$mainMod, SPACE, exec, $launcher"
			"$mainMod, E, exec, $fileManager"
			"$mainMod, T, exec, $terminal"
			"SHIFT_ALT, N, exec, $webBrowser"
			"SHIFT_ALT, M, exec, $discord"
		];
	};
}
