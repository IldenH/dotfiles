{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  mkTimeout = command:
    lib.getExe (pkgs.writeShellScriptBin "timeout-script" ''
      #!/usr/bin/env bash
      if ! hyprctl clients | grep -i cstimer; then
        ${command}
      fi
    '');
in {
  imports = [
    inputs.hypridle.homeManagerModules.default
  ];

  options.settings.hypridle.enable = lib.mkEnableOption "hypridle";

  config.services.hypridle = lib.mkIf (config.settings.hypridle.enable) {
    enable = true;
    listeners = [
      {
        timeout = 300;
        onTimeout = mkTimeout "pidof hyprlock || hyprlock";
      }
      {
        timeout = 330;
        onTimeout = mkTimeout "hyprctl dispatch dpms off";
        onResume = "hyprctl dispatch dpms on";
      }
    ];
  };
}
