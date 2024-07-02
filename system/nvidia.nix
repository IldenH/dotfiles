{
  config,
  lib,
  ...
}: {
  options.settings.nvidia.enable = lib.mkEnableOption "nvidia";

  config = lib.mkIf config.settings.nvidia.enable {
    boot.kernelParams = ["nvidia-drm.fbdev=1"];
    hardware.graphics.enable = true;
    services.xserver.videoDrivers = ["nvidia"];
    hardware.nvidia = {
      modesetting.enable = true;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.latest;
    };
  };
}
