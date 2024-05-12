{
  config,
  lib,
  ...
}: {
  options.settings.nightlight.enable = lib.mkEnableOption "nightlight";

  config.services.gammastep = lib.mkIf (config.settings.nightlight.enable) {
    enable = true;
    latitude = 0.0;
    longitude = 0.0;
    temperature.day = 3600;
    temperature.night = 3600;
  };
}
