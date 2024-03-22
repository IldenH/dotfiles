{ config, pkgs, inputs, global, lib, ... }:

{
  home = {
    username = "${global.username}";
    homeDirectory = "/home/${global.username}";
    stateVersion = "23.11";
  };

  imports = [
		inputs.nix-colors.homeManagerModules.default
		./programs
  ];

	colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-medium;

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

  nixpkgs.config.allowUnfree = true;

	programs.home-manager.enable = true;
}
