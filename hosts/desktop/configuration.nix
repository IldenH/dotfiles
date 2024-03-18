{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
			../../system
    ];


	networking = {
		hostName = "nixos";
  	# wireless.enable = true;
  	networkmanager.enable = true;
	};

	xdg.portal = {
		enable = true;
		wlr.enable = true;
		configPackages = [ pkgs.xdg-desktop-portal-gtk ];
		extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
	};

	services = {
		printing.enable = true;
		fstrim.enable = true;
		# xserver = {
		# 	enable = true;
		#		displayManager.sddm.enable = true;
  	# 	desktopManager.plasma6.enable = true;
		# };
	};

	programs = {
		zsh.enable = true;
		dconf.enable = true;
	};

  environment.shells = [ pkgs.zsh ];

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

  system.stateVersion = "23.11";
}
