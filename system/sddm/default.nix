{ config, pkgs, lib, ... }:

{
	options.settings.sddm.enable = lib.mkEnableOption "sddm";

	config = lib.mkIf (config.settings.sddm.enable) {
		services.xserver = {
			enable = true;
			displayManager = {
				sddm.enable = true;
				sddm.wayland.enable = true;
				sddm.theme = "${import ./sddm-theme.nix { inherit pkgs; }}";
			};
		};
  	# sddm-theme
		environment.systemPackages = with pkgs.libsForQt5.qt5; [
			qtquickcontrols2
			qtgraphicaleffects
		];
	};
}
