{ lib, config, pkgs, ... }:

{
	options.settings.games.enable = lib.mkEnableOption "games";

	# should probably just merge this into some other file TODO
	config = lib.mkIf (config.settings.games.enable) {
		home.packages = with pkgs; [
			heroic
			# lutris
			prismlauncher
		];
	};
}
