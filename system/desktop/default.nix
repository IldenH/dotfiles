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
  security.pam.services.hyprlock = {};
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
}
