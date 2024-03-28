{ pkgs, lib, config, ... }:

{
	options.settings.hyprland.enable = lib.mkEnableOption "hyprland";

	config = lib.mkIf (config.settings.hyprland.enable) {
		xdg.portal = {
			enable = true;
			wlr.enable = true;
			configPackages = [ pkgs.xdg-desktop-portal-gtk ];
			extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
		};

		environment.sessionVariables = {
			WLR_NO_HARDWARE_CURSORS = "1";
			NIXOS_OZONE_WL = "1";
		};

		programs.hyprland.enable = true;
	};
}
