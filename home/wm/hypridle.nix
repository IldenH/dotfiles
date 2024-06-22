{
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

  services.hypridle.listeners = [
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
}
