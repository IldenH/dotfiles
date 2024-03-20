{ inputs, ... }:

let
	wallpaper = ./wallpaper.jpg;
in
{
	imports = [
		inputs.hyprpaper.homeManagerModules.hyprpaper
	];

	# Not needed in hyprland startup because this creates a service
	services.hyprpaper = {
		enable = true;
		ipc = true;

		preloads = [
			"${wallpaper}"
		];
		wallpapers = [
			", ${wallpaper}"
		];
	};
}
