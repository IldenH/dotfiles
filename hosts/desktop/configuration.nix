{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
			../../system
    ];

  networking.hostName = "nixos";
  # networking.wireless.enable = true;
  networking.networkmanager.enable = true;

	xdg.portal = {
		enable = true;
		wlr.enable = true;
		configPackages = [ pkgs.xdg-desktop-portal-gtk ];
		extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
	};

	services.xserver = {
		enable = true;
		displayManager.sddm.enable = true;
  	desktopManager.plasma6.enable = true;
	};

	services.printing.enable = true;

  environment.shells = [ pkgs.zsh ];
  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    curl
    git
    home-manager
    neovim
    wget
  ];

	environment.sessionVariables = {
		WLR_NO_HARDWARE_CURSORS = "1";
		NIXOS_OZONE_WL = "1";
	};

	programs.dconf.enable = true;

  system.stateVersion = "23.11";
}
