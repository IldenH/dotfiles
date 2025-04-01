{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  # disabled due to broken :(
  # imports = [inputs.wl-screenrec-daemon.homeManagerModules.wl-screenrec-daemon];
  #
  # config = lib.mkIf config.settings.hyprland.enable {
  #   home.packages = [inputs.wl-screenrec-daemon.packages.${pkgs.system}.default];
  #   # wl-screenrec-daemon --daemon -h 20 -- --low-power off --output HDMI-A-3 --audio --audio-device monitor_MONO --bitrate "0.1 KB" --encode-resolution "854x480"
  # };
}
