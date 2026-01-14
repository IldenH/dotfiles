{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./firefox.nix
    ./games.nix
    ./japanese.nix
    ./media.nix
    ./searx.nix
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  programs.hyprland.enable = config.hm.settings.hyprland.enable;
  programs.hyprland.portalPackage = pkgs.xdg-desktop-portal-hyprland;
  security.pam.services.hyprlock = {};

  xdg.portal = {
    enable = true;
    config.common.default = "*";
    xdgOpenUsePortal = true;
    wlr.enable = true;
    extraPortals = with pkgs; [xdg-desktop-portal-gtk];
  };
}
