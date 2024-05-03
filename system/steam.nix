{ config, pkgs, lib, ... }:

{
	options.settings.steam.enable = lib.mkEnableOption "steam";
	options.settings.games.enable = lib.mkEnableOption "games";

	config = lib.mkMerge [
		(lib.mkIf (config.settings.steam.enable) {
			programs.steam = {
			  enable = true;
			  remotePlay.openFirewall = true;
			  dedicatedServer.openFirewall = true;
				gamescopeSession.enable = true;
			};

			settings.games.enable = true;
		})
		(lib.mkIf (config.settings.games.enable) {
			programs = {
				gamemode.enable = true;
				gamescope.enable = true;
			};
		})
	];
}
