{ config, pkgs, lib, ... }:

{
	options.settings.steam.enable = lib.mkEnableOption "steam";

	config = lib.mkIf (config.settings.steam.enable) {
		environment.systemPackages = [ pkgs.adwsteamgtk ];
		programs.steam = {
		  enable = true;
		  remotePlay.openFirewall = true;
		  dedicatedServer.openFirewall = true;
		};
	};
}
