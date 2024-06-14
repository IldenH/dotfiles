{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  options.settings.qt-gtk.enable = lib.mkEnableOption "qt and gtk";

  config = lib.mkIf config.settings.qt-gtk.enable {
    qt = {
      enable = true;
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
      gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
      theme = {
        package = import ./gtk.nix {inherit pkgs;} {scheme = config.colorScheme;};
        name = "${config.colorScheme.slug}";
      };

      iconTheme = {
        package = pkgs.tela-circle-icon-theme;
        name = "Tela-circle";
      };
    };

    home.pointerCursor = {
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
