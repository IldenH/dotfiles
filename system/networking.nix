{
  config,
  lib,
  global,
  hostName,
  ...
}: {
  options.settings.networking = {
    enable = lib.mkEnableOption "networking";
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

      # speedup boot
      systemd.services."NetworkManager-wait-online".enable = false;
    })
  ];
}
