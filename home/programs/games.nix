{ lib, config, pkgs, ... }:

{
	options.settings.games.enable = lib.mkEnableOption "games";

	config = lib.mkIf (config.settings.games.enable) {
		home.packages = with pkgs; [
			gamemode
			gamescope
			heroic
			# lutris
			prismlauncher
		];

		programs.mangohud.enable = true;
	};
}
