{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../system
  ];

  # boot.kernelPackages = pkgs.linuxPackages_latest;
  services = {
    openssh.enable = true;
    openssh.startWhenNeeded = true;
    printing.enable = true;
    home-assistant.enable = true;
  };

  networking.firewall.allowedTCPPorts = [8765]; # ankiconnect
  virtualisation.docker.enable = true;
  virtualisation.docker.enableOnBoot = false;

  networking.hostId = "5c73541f";

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

  # https://github.com/ilya-zlobintsev/LACT/issues/289
  environment.etc."lact/config.yaml".source = ./lact.yaml;
  # environment.etc."lact/config.yaml".text = builtins.toJSON {
  #   gpus."1002:67DF-174B:E347-0000:01:00.0" = {
  #     fan_control_enabled = true;
  #     fan_control_settings = {
  #       mode = "curve";
  #       temperature_key = "edge";
  #       interval_ms = 500;
  #       curve = {
  #         "40" = 0.15;
  #         "50" = 0.35;
  #         "60" = 0.5;
  #         "70" = 0.75;
  #         "80" = 1.0;
  #       };
  #       spindown_delay_ms = 5000;
  #       change_threshold = 2;
  #     };
  #     power_cap = 145.0;
  #     performance_level = "low";
  #   };
  # };

  system.stateVersion = "23.11";
}
