{ inputs, pkgs, global, ... }:
{
  home = {
    username = "${global.user.name}";
    homeDirectory = "/home/${global.user.name}";
    stateVersion = "23.11";
  };

	imports = [
		inputs.nix-colors.homeManagerModules.default

		# ./programs/browser.nix # WIP
		./programs/discord.nix
		./programs/files.nix
		# ./programs/japanese.nix # broken, don't know why
		./programs/shell
		./programs/steam.nix
		./programs/texlive.nix
		./programs/wm
		./programs/zathura.nix
	];
  home.packages = with pkgs; [
		anki
		authenticator
		cinnamon.pix
		firefox
		geogebra6
		gimp
		heroic
		python311
		qalculate-gtk
		thunderbird
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

  nixpkgs.config.allowUnfree = true;

	programs = {
		mpv.enable = true;
		home-manager.enable = true;
	};
}
