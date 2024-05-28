{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: let
  nix-colors-lib = inputs.nix-colors.lib.contrib {inherit pkgs;};
in {
  options.settings.qt-gtk-themes.enable = lib.mkEnableOption "qt and gtk themes";

  config = lib.mkIf (config.settings.qt-gtk-themes.enable) {
    qt = {
      enable = true;
      # platformTheme = "gtk";
      # style = {
      # 	package = pkgs.adwaita-qt;
      # 	name = "adwaita-dark";
      # };
      platformTheme.name = "gtk";
      style = {
        name = "gtk2";
        package = pkgs.qt6Packages.qt6gtk2;
      };
    };
    home.packages = with pkgs; [
      libsForQt5.qt5.qtwayland
      kdePackages.qtwayland
    ];

    gtk = {
      enable = true;
      theme = {
        # package = nix-colors-lib.gtkThemeFromScheme {
        # 	scheme = config.colorScheme;
        # };
        package = import ./gtk.nix {inherit pkgs;} {scheme = config.colorScheme;};
        name = "${config.colorScheme.slug}";
      };

      iconTheme = {
        package = pkgs.tela-circle-icon-theme;
        name = "Tela-circle";
      };
    };

    home.pointerCursor = {
      # package = pkgs.catppuccin-cursors.macchiatoDark;
      # name = "Catppuccin-Macchiato-Dark-Cursors";
      package = inputs.nix-cursors.packages.${pkgs.system}.bibata-original-cursor.override {
        background_color = "#${config.colorScheme.palette.base00}";
        outline_color = "#${config.colorScheme.palette.base07}";
        accent_color = "#${config.colorScheme.palette.base01}";
        replace_crosshair = true;
      };
      name = "Bibata-Original-Custom";
      size = 22;
      gtk.enable = true;
    };
  };
}
