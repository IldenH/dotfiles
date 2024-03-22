{ config, inputs, lib, ... }:

{
	options = {
		wallpaper = lib.mkOption {
			type = lib.types.path;
		};
	};

	imports = [
		inputs.hyprpaper.homeManagerModules.hyprpaper
	];

	config = lib.mkIf (config.wallpaper != null) {
		services.hyprpaper = {
			enable = true;
			splash = false;
			ipc = true;

			preloads = [
				"${config.wallpaper}"
			];
			wallpapers = [
				", ${config.wallpaper}"
			];
		};
	};
}
