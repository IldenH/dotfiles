{
  config,
  lib,
  pkgs,
  ...
}: {
  options.settings.laptop.enable = lib.mkEnableOption "laptop";

  config = lib.mkIf config.settings.laptop.enable {
    home.packages = with pkgs; [
      brightnessctl
      pavucontrol
    ];
  };
}
