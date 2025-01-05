{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../system
  ];

  # boot.kernelPackages = pkgs.linuxPackages_latest;
  services = {
    openssh.enable = true;
    syncthing.enable = true;
    printing.enable = true;
    logind.powerKey = "ignore";
  };

  virtualisation.docker.enable = true;

  networking.hostId = "32bb9655";
  boot.zfs.devNodes = "/dev/disk/by-partuuid";

  settings = {
    keyMap = "no";

    networking = {
      enable = true;
      wifi.enable = true;
      bluetooth.enable = false;
    };

    graphics.enable = true;

    japanese.enable = true;
    sound.enable = true;
    utils.enable = true;

    zfs.enable = true;
    zfs.encryption = true;
    zfs.snapshots = true;
    impermanence.enable = true;
  };

  system.stateVersion = "24.11";
}
