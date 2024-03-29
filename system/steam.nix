{ config, pkgs, lib, ... }:

{
	options.settings.steam.enable = lib.mkEnableOption "steam";

	config = lib.mkIf (config.settings.steam.enable) {
		programs.steam = {
		  enable = true;
		  remotePlay.openFirewall = true;
		  dedicatedServer.openFirewall = true;
		};
	};
}
