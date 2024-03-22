{ inputs, pkgs, global, ... }:
{
  home = {
    username = "${global.username}";
    homeDirectory = "/home/${global.username}";
    stateVersion = "23.11";
  };

	imports = [
		inputs.nix-colors.homeManagerModules.default

		# ./programs/browser.nix
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
		calc
		firefox
		geogebra6
		heroic
		python311
		thunderbird
		gimp
		cinnamon.pix
  ];

	xdg.mimeApps.defaultApplications = {
		"image/*" = [ "pix.desktop" ];
		"video/*" = [ "mpv.desktop" ];
	};

  nixpkgs.config.allowUnfree = true;

	programs = {
		mpv.enable = true;
		home-manager.enable = true;
	};
}