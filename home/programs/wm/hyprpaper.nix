{ config, inputs, lib, ... }:

{
	options.settings.wallpaper = lib.mkOption {
		type = lib.types.path;
	};

	imports = [
		inputs.hyprpaper.homeManagerModules.hyprpaper
	];

	config = lib.mkIf (config.settings.wallpaper != null) {
		services.hyprpaper = {
			enable = true;
			splash = false;
			ipc = true;

			preloads = [
				"${config.settings.wallpaper}"
			];
			wallpapers = [
				", ${config.settings.wallpaper}"
			];
		};
	};
}
