{
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
  services.hypridle.settings.listener = [
    {
      timeout = 300;
      on-timeout = mkTimeout "pidof hyprlock || hyprlock";
    }
    {
      timeout = 330;
      on-timeout = mkTimeout "hyprctl dispatch dpms off";
      on-resume = "hyprctl dispatch dpms on";
    }
  ];
}
