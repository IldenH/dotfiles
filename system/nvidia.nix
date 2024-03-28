{ config, pkgs, lib, ... }:

{
	options.settings.nvidia.enable = lib.mkEnableOption "nvidia";

	config = lib.mkIf (config.settings.nvidia.enable) {
	  hardware.opengl = {
	    enable = true;
	    driSupport = true;
	    driSupport32Bit = true;
	  };
	  services.xserver.videoDrivers = ["nvidia"];
	  hardware.nvidia = {
	    modesetting.enable = true;
	    powerManagement.enable = false;
	    powerManagement.finegrained = false;
	    open = false;
	    nvidiaSettings = true;
	    package = config.boot.kernelPackages.nvidiaPackages.stable;
	  };
	};
}
