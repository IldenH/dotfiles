{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
			../../modules/japanese.nix
			../../modules/nvidia.nix
			../../modules/kde.nix
			# ../../modules/steam.nix # uses alot of space
    ];

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 2;

  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
    useOSProber = true;
  };

  networking.hostName = "nixos";
  # networking.wireless.enable = true;
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Oslo";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "nb_NO.UTF-8";
    LC_IDENTIFICATION = "nb_NO.UTF-8";
    LC_MEASUREMENT = "nb_NO.UTF-8";
    LC_MONETARY = "nb_NO.UTF-8";
    LC_NAME = "nb_NO.UTF-8";
    LC_NUMERIC = "nb_NO.UTF-8";
    LC_PAPER = "nb_NO.UTF-8";
    LC_TELEPHONE = "nb_NO.UTF-8";
    LC_TIME = "nb_NO.UTF-8";
  };

  services.xserver.xkb = {
    layout = "no";
    variant = "";
  };

  console.keyMap = "no";

  services.printing.enable = true;

	xdg.portal = {
		enable = true;
		wlr.enable = true;
		configPackages = [ pkgs.xdg-desktop-portal-gtk ];
		extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
	};

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
    #media-session.enable = true;
  };

  # Don't forget to set a password with ‘passwd’.
  users.users.ildenhnix = {
    isNormalUser = true;
    description = "IldenH";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ ];
		shell = pkgs.zsh;
  };

  environment.shells = [ pkgs.zsh ];
  programs.zsh.enable = true;

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

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
