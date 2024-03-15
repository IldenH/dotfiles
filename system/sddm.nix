{ config, pkgs, ... }:

{
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
}
