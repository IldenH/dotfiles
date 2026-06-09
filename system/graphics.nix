{
  config,
  lib,
  pkgs,
  ...
}: {
  options.settings.graphics.enable = lib.mkEnableOption "graphics";
  options.settings.amd.enable = lib.mkEnableOption "amd";
  options.settings.nvidia.enable = lib.mkEnableOption "nvidia";

  config = lib.mkMerge [
    (lib.mkIf config.settings.graphics.enable {
      hardware.graphics.enable = true;
      hardware.graphics.enable32Bit = true;
    })
    (lib.mkIf config.settings.amd.enable {
      settings.graphics.enable = true;
      services.xserver.videoDrivers = ["amdgpu"];

      environment.systemPackages = with pkgs; [lact];
      systemd.packages = with pkgs; [lact];
      systemd.services.lactd.wantedBy = ["multi-user.target"];
    })
    (lib.mkIf config.settings.nvidia.enable {
      settings.graphics.enable = true;
      boot.kernelParams = ["nvidia-drm.fbdev=1"];
      services.xserver.videoDrivers = ["nvidia"];
      hardware.nvidia = {
        modesetting.enable = true;
        open = true;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.latest;
      };

      # https://wiki.nixos.org/wiki/CUDA
      nixpkgs.config.cudaSupport = true;
      nix.settings = {
        substituters = [
          "https://cache.nixos-cuda.org"
        ];
        trusted-public-keys = [
          "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="
        ];
      };
    })
  ];
}
