{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../system
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  services.openssh.enable = true;

  settings = {
    sddm.image = ../sddm.jpg;

    keyMap = "no";

    networking = {
      enable = true;
      wifi.enable = false;
      bluetooth.enable = false;
    };

    japanese.enable = true;
    nvidia.enable = true;
    sound.enable = true;
    utils.enable = true;
  };

  system.stateVersion = "23.11";
}
