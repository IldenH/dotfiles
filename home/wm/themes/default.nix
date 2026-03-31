{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  options.settings.qt-gtk.enable = lib.mkEnableOption "qt and gtk";

  imports = [./qt.nix ./gtk.nix];

  config = lib.mkIf config.settings.qt-gtk.enable {
    home.pointerCursor = {
      package = inputs.nix-cursors.packages.${pkgs.stdenv.hostPlatform.system}.bibata-original-cursor.override {
        background_color = "#${config.colorScheme.palette.base00}";
        outline_color = "#${config.colorScheme.palette.base07}";
        accent_color = "#${config.colorScheme.palette.base01}";
        replace_crosshair = true;
      };
      name = "Bibata-Original-Custom";
      size = 22;
      gtk.enable = true;
      dotIcons.enable = false;
    };
  };
}
