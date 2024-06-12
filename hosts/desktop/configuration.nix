{
  pkgs,
  name,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../system
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  settings = {
    sddm.image = ../sddm.jpg;

    keyMap = "no";

    networking = {
      enable = true;
      hostname = name;
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
