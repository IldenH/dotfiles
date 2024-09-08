{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../system
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  services = {
    openssh.enable = true;
    syncthing.enable = true;
    printing.enable = true;
  };

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
  };

  system.stateVersion = "23.11";
}
