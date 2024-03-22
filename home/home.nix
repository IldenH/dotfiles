{ config, pkgs, inputs, global, ... }:

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

  nixpkgs.config.allowUnfree = true;

	programs.home-manager.enable = true;
}
