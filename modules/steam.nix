{ config, pkgs, ... }:

{
	environment.systemPackages = [ pkgs.adwsteamgtk ];
	programs.steam = {
	  enable = true;
	  remotePlay.openFirewall = true;
	  dedicatedServer.openFirewall = true;
	};
}
