{ config, pkgs, ... }:

{
  imports = [
     ./hardware-configuration.nix
		../../system
  ];

	settings = {
		hyprland.enable = true;
		sddm.enable = true;

		locale = {
			main = "en_US.UTF-8";
			extra = "nb_NO.UTF-8";
			timeZone = "Europe/Oslo";
			keyMap = "no";
		};

		networking = {
			enable = true;
			hostname = "nixos-desktop";
			wifi.enable = false;
			bluetooth.enable = false;
		};

		japanese.enable = true;
		nvidia.enable = true;
		optimization.enable = true;
		sound.enable = true;
		steam.enable = true;
		utils.enable = true;

		shell = pkgs.zsh;
	};

  system.stateVersion = "23.11";
}
