{
  config,
  pkgs,
  lib,
  global,
  ...
}: {
  options.settings.networking = {
    enable = lib.mkEnableOption "networking";
    wifi.enable = lib.mkEnableOption "wifi";
    bluetooth.enable = lib.mkEnableOption "bluetooth";
    hostname = lib.mkOption {
      type = lib.types.str;
      default = "nixos";
    };
  };

  config = lib.mkMerge [
    (lib.mkIf (config.settings.networking.bluetooth.enable) {
      hardware.bluetooth.enable = true;
      services.blueman.enable = true;
    })
    (lib.mkIf (config.settings.networking.enable) {
      networking.hostName = config.settings.networking.hostname;
      networking.networkmanager.enable = true;
      users.users.${global.user.name}.extraGroups = ["networkmanager"];
    })
    (lib.mkIf (config.settings.networking.wifi.enable) {
      settings.networking.enable = true;
      networking.networkmanager.wifi.backend = "iwd";
      networking.wireless.iwd = {
        enable = true;
        settings.General.EnableNetworkConfiguration = true;
      };
    })
  ];
}
