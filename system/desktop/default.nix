{config, ...}: {
  imports = [
    ./firefox.nix
    ./games.nix
    ./japanese.nix
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  programs.hyprland.enable = config.hm.settings.hyprland.enable;
  security.pam.services.hyprlock = {};
}
