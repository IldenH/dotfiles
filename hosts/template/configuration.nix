_: {
  imports = [
    ./hardware-configuration.nix
    ../../system
  ];

  services = {
    openssh.enable = true;
    syncthing.enable = true;
    printing.enable = true;
  };

  virtualisation.docker.enable = true;

  networking.hostId = "placeholder";

  settings = {
    keyMap = "no";

    networking = {
      enable = true;
      bluetooth.enable = false;
    };

    graphics.enable = true;

    japanese.enable = true;
    sound.enable = true;
    utils.enable = true;

    zfs.enable = true;
    zfs.encryption = false;
    zfs.snapshots = true;
    impermanence.enable = true;
  };

  system.stateVersion = "24.11";
}
