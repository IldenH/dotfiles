{
  lib,
  config,
  ...
}: {
  imports = [
    ./impermanence.nix
  ];

  options.settings.zfs = {
    enable = lib.mkEnableOption "zfs";
    encryption = lib.mkEnableOption "zfs encryption";
    snapshots = lib.mkEnableOption "zfs snapshots";
  };

  config = lib.mkIf config.settings.zfs.enable {
    boot = {
      supportedFilesystems.zfs = true;
      zfs.requestEncryptionCredentials = config.settings.zfs.encryption;
    };

    services.zfs = {
      autoScrub.enable = true;
      trim.enable = true;
    };

    swapDevices = [{device = "/dev/disk/by-label/SWAP";}];

    fileSystems = {
      "/boot" = {
        device = "/dev/disk/by-label/NIXBOOT";
        fsType = "vfat";
      };

      # zfs datasets
      "/nix" = {
        device = "zroot/nix";
        fsType = "zfs";
      };

      "/tmp" = {
        device = "zroot/tmp";
        fsType = "zfs";
      };

      "/persist" = {
        device = "zroot/persist";
        fsType = "zfs";
        neededForBoot = true;
      };

      "/persist/cache" = {
        device = "zroot/cache";
        fsType = "zfs";
        neededForBoot = true;
      };
    };

    systemd.services.systemd-udev-settle.enable = false;

    services.sanoid = {
      enable = config.settings.zfs.snapshots;
      datasets = {
        "zroot/persist" = {
          hourly = 50;
          daily = 15;
          weekly = 3;
          monthly = 1;
        };
      };
    };
  };
}
