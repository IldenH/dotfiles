{ inputs, pkgs, global, ... }:
{
  home = {
    username = "${global.user.name}";
    homeDirectory = "/home/${global.user.name}";
    stateVersion = "23.11";
  };

	imports = [
		inputs.nix-colors.homeManagerModules.default

		./programs/browser
		./programs/discord
		# ./programs/espanso.nix # service doesn't run properly
		./programs/files.nix
		./programs/games.nix
		./programs/shell
		./programs/steam.nix
		./programs/wm
		./programs/zathura.nix
	];
  home.packages = with pkgs; [
		anki-bin
		cinnamon.pix
		geogebra6
		gimp
		python311
		qalculate-gtk
  ];

	# setting /* only sometimes works
	xdg.mimeApps.defaultApplications = {
		"image/*" = "pix.desktop";
		"image/png" = "pix.desktop";
		"image/jpg" = "pix.desktop";
		"image/jpeg" = "pix.desktop";
		"video/*" = "mpv.desktop";
		"video/mp4" = "mpv.desktop";
		"video/mov" = "mpv.desktop";
		"video/webm" = "mpv.desktop";
		"video/ogg" = "mpv.desktop";
	};

	xdg.userDirs = {
		enable = true;
		createDirectories = true;
		desktop = null;
		publicShare = null;
		templates = null;
	};

  nixpkgs.config.allowUnfree = true;

	programs = {
		mpv.enable = true;
		home-manager.enable = true;
	};
}
