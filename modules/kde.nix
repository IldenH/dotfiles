{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver = {
		enable = true;
		displayManager = {
			sddm.enable = true;
			# sddm.theme = "${import ./sddm-theme.nix { inherit pkgs; }}";
		};
	};
  # sddm-theme
	# environment.systemPackages = with pkgs.libsForQt5.qt5; [
	# 	qtquickcontrols2
	# 	qtgraphicaleffects
	# ];

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.desktopManager.plasma6.enable = true;

	# This doesn't work for some reason, doesn't break anything though
	# environment.plasma6.excludePackages = with pkgs.kdePackages; [
	#   plasma-browser-integration
	#   konsole
	#   # oxygen
	#   # kate
	# 	elisa
	# 	spectacle
	# 	kwalletmanager
	# ];

	# environment.systemPackages = with pkgs.kdePackages; [
	#   kcmutils
	# 	sddm-kcm
	# ];

	# programs.dconf.enable = true;
}
