{ config, inputs, pkgs, lib, ... }:

{
	options.settings.hyprland.enable = lib.mkOption {
		type = lib.types.bool;
		default = false;
	};

	# TODO: make it so these don't get imported if hyprland.enable = false
	imports = [
		./apps.nix
		./binds.nix
		./rules.nix
		./settings.nix
		./screenshots.nix
		./workspaces.nix
	];
	config = lib.mkIf (config.settings.hyprland.enable) {
		home.packages = with pkgs; [
			seatd
			rofi-wayland
			dunst
			libnotify
		];
		wayland.windowManager.hyprland = {
			enable = true;
			package = inputs.hyprland.packages."${pkgs.system}".hyprland;
			xwayland.enable = true;
		};
	};
}
