{ pkgs, ... }:

{
	imports = [
		# ./browser.nix
		./discord.nix
		# ./japanese.nix # broken, don't know why
		./mimeapps.nix
		./shell
		./steam.nix
		./texlive.nix
		./wm
	];
  home.packages = with pkgs; [
		anki
		authenticator
		calc
		firefox
		# flameshot
		geogebra6
		heroic
		python311
		thunderbird
		# unclutter # doesn't work on wayland
		# xorg.xmodmap
		gimp
		# loupe
		cinnamon.pix
  ];

	programs.mpv.enable = true;
}
