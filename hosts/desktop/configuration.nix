{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../system
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  settings = {
    sddm.image = ../sddm.jpg;

    locale = {
      main = "en_US.UTF-8";
      extra = "nb_NO.UTF-8";
      timeZone = "Europe/Oslo";
      keyMap = "no";
    };

    networking = {
      enable = true;
      hostname = "desktop";
      wifi.enable = false;
      bluetooth.enable = false;
    };

    japanese.enable = true;
    nvidia.enable = true;
    sound.enable = true;
    utils.enable = true;

    shell = pkgs.zsh;
  };

  system.stateVersion = "23.11";
}
