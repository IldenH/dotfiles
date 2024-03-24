{ ... }:

{
	wayland.windowManager.hyprland.settings = {
		"$terminal" = "kitty";
		"$fileManager" = "nemo";
		"$webBrowser" = "firefox";
		"$launcher" = "rofi -show drun -show-icons";

		bind = [
			"$mainMod, SPACE, exec, $launcher"
			"$mainMod, E, exec, $fileManager"
			"$mainMod, T, exec, $terminal"
			
			# Browser profiles and stuff
			"SHIFT_ALT, N, exec, $webBrowser -P Main"
			"SHIFT_ALT, H, exec, $webBrowser -P Skole https://classroom.google.com/"
			"SHIFT_ALT, Y, exec, $webBrowser -P Digilaer https://skole.digilaer.no/auth/saml/index.php?wantsurl=https%3A%2F%2Fskole.digilaer.no%2Fmy%2F"
			"SHIFT_ALT, U, exec, $webBrowser -P Digilaer https://skole.digilaer.no/auth/saml/index.php?wantsurl=https%3A%2F%2Fskole.digilaer.no%2Fmod%2Fadobeconnect%2Fview.php%3Fid%3D13352"
		];
	};
}
