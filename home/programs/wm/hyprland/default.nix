{
  config,
  inputs,
  pkgs,
  lib,
  ...
}: {
  options.settings = {
    hyprland.enable = lib.mkEnableOption "hyprland";
    wallpaper = lib.mkOption {
      type = lib.types.path;
    };
  };

  imports = [
    ./apps.nix
    ./binds.nix
    ./rules.nix
    ./settings.nix
    ./screenshots.nix
    ./workspaces.nix
  ];
  config = lib.mkIf (config.settings.hyprland.enable) {
    home.packages = with pkgs; [
      libnotify
      nwg-displays
      rofi-wayland
      seatd
      swaybg
    ];
    wayland.windowManager.hyprland = {
      enable = true;
      package = inputs.hyprland.packages."${pkgs.system}".hyprland;
      xwayland.enable = true;
    };
  };
}
