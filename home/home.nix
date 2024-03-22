{ config, inputs, lib, ... }:

{
  imports = [ ./. ];

	colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-medium;

	settings = {
		wallpaper = ./wallpaper.jpg;
	
		discord.enable = true;
	
		terminal = {
			enable = true;
			neovim.enable = true;
			cli.enable = true;
			zsh = {
				enable = true;
				theme = "simple";
			};
		};
	};
}
