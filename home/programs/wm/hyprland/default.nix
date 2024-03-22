{ inputs, pkgs, ... }:

{
	imports = [
		./apps.nix
		./binds.nix
		./settings.nix
		./screenshots.nix
	];
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
}
