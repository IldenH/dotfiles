{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm = {
		enable = true;
		# theme = "sugar-dark";
	};
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

	qt = {
	  enable = true;
	  platformTheme = "kde";
	  style = "breeze";
	};

	# programs.dconf.enable = true;
}
