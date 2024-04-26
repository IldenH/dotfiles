{ config, inputs, lib, ... }:

{
  imports = [ ../. ];

	colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-medium;

	settings = {
		wallpaper = ../wallpaper.jpg;
	
		zathura.enable = true;
		discord.enable = true;
		browser.enable = true;
		files.enable = true;
		nightlight.enable = false; # doesn't work with Nvida 535, using monitor's builtin nightlight
		qt-gtk-themes.enable = true;
		steam.enable = true;
		games.enable = true;
		# espanso.enable = true; # service doesn't run properly

		screenshots = {
			enable = true;
			format = "%Y-%m-%d_%H-%M-%S.png";
			path = {
				raw = "$HOME/Pictures/Screenshots/Raw";
				edited = "$HOME/Pictures/Screenshots/Edited";
			};
		};
	
		terminal = {
			enable = true;
			neovim.enable = true;
			cli.enable = true;
			zsh = {
				enable = true;
				theme = "simple";
			};
		};

		waybar.enable = true;
		mako.enable = true;

		hyprland = {
			enable = true;
		};
	};
}
