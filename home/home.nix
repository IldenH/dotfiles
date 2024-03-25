{ config, inputs, lib, ... }:

{
  imports = [ ./. ];

	colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-medium;

	settings = {
		wallpaper = ./wallpaper.jpg;
	
		zathura.enable = true;
		discord.enable = true;
		# browser.enable = true; # WIP

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

		hyprland = {
			enable = true;
		};
	};
}
