{
  config,
  inputs,
  lib,
  ...
}: {
  imports = [
    inputs.hypridle.homeManagerModules.default
  ];

  options.settings.hypridle.enable = lib.mkEnableOption "hypridle";

  config.services.hypridle = lib.mkIf (config.settings.hypridle.enable) {
    enable = true;
    listeners = [
      {
        timeout = 900;
        onTimeout = "pidof hyprlock || hyprlock && loginctl lock-session";
      }
      {
        timeout = 930;
        onTimeout = "hyprctl dispatch dpms off";
        onResume = "hyprctl dispatch dpms on";
      }
    ];
  };
}
