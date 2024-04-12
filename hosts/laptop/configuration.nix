{ config, pkgs, ... }:

{
  imports = [
     # ./hardware-configuration.nix # TODO: generate hardware-configuration
		../../system
  ];

	boot.kernelPackages = pkgs.linuxPackages_latest;

	settings = {
		hyprland.enable = true;
		sddm.image = ../sddm.jpg;

		locale = {
			main = "en_US.UTF-8";
			extra = "nb_NO.UTF-8";
			timeZone = "Europe/Oslo";
			keyMap = "no";
		};

		networking = {
			enable = true;
			hostname = "nixos-laptop";
			wifi.enable = true;
			bluetooth.enable = false;
		};

		japanese.enable = true;
		optimization.enable = true;
		sound.enable = true;
		utils.enable = true;

		shell = pkgs.zsh;
	};

  system.stateVersion = "23.11";
}