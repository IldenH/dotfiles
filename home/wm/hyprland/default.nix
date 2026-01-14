{
  config,
  pkgs,
  lib,
  ...
}: {
  options.settings = {
    hyprland.enable = lib.mkEnableOption "hyprland";
    wallpaper = lib.mkOption {type = lib.types.path;};
  };

  imports = [
    ./apps.nix
    ./binds.nix
    ./rules.nix
    ./settings.nix
    ./screenrec.nix
    ./screenshots.nix
    ./workspaces.nix
  ];

  config = lib.mkIf config.settings.hyprland.enable {
    home.packages = with pkgs; [
      libnotify
      nwg-displays
      seatd
      swaybg
    ];
    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
      systemd.variables = ["--all"];
    };
  };
}
