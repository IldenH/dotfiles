{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../system
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  services.openssh.enable = true;

  settings = {
    sddm.image = ../../assets/sddm.jpg;

    keyMap = "no";

    networking = {
      enable = true;
      wifi.enable = true;
      bluetooth.enable = false;
    };

    japanese.enable = true;
    sound.enable = true;
    utils.enable = true;
  };

  system.stateVersion = "23.11";
}
