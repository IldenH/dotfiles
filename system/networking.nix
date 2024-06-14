{
  config,
  lib,
  global,
  hostName,
  ...
}: {
  options.settings.networking = {
    enable = lib.mkEnableOption "networking";
    wifi.enable = lib.mkEnableOption "wifi";
    bluetooth.enable = lib.mkEnableOption "bluetooth";
  };

  config = lib.mkMerge [
    (lib.mkIf config.settings.networking.bluetooth.enable {
      hardware.bluetooth.enable = true;
      services.blueman.enable = true;
    })
    (lib.mkIf config.settings.networking.enable {
      networking.hostName = hostName;
      networking.networkmanager.enable = true;
      users.users.${global.user.name}.extraGroups = ["networkmanager"];
    })
    (lib.mkIf config.settings.networking.wifi.enable {
      settings.networking.enable = true;
      networking.networkmanager.wifi.backend = "iwd";
      networking.wireless.iwd = {
        enable = true;
        settings.General.EnableNetworkConfiguration = true;
      };
    })
  ];
}
