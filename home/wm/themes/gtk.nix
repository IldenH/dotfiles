# stolen from https://github.com/nix-community/stylix/blob/9b4a5eb409ceac2dd6ad495c7988e189a418cd30/modules/gtk/hm.nix
{
  pkgs,
  config,
  lib,
  ...
}: {
  config = let
    finalCss = pkgs.writeText "gtk.css" (import ./gtk-theme.nix {inherit config lib;});
  in
    lib.mkIf config.settings.qt-gtk.enable
    {
      gtk = {
        enable = true;
        gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
        theme = {
          package = pkgs.adw-gtk3;
          name = "adw-gtk3";
        };
        gtk4.theme = config.gtk.theme;

        iconTheme = {
          package = pkgs.tela-circle-icon-theme;
          name = "Tela-circle";
        };
      };

      xdg.configFile = {
        "gtk-3.0/gtk.css".source = finalCss;
        "gtk-4.0/gtk.css".source = finalCss;
      };

      # Flatpak apps apparently don't consume the CSS config. This workaround appends it to the theme directly.
      home.file.".themes/${config.gtk.theme.name}".source =
        pkgs.stdenvNoCC.mkDerivation
        {
          name = "flattenedGtkTheme";
          src = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}";

          installPhase = ''
            cp --recursive . $out
            cat ${finalCss} | tee --append $out/gtk-{3,4}.0/gtk.css
          '';
        };

      # xdg.dataFile."flatpak/overrides/global".text =
      #   config.xdg.dataFile."flatpak/overrides/global".text
      #   + ''
      #     [Context]
      #     filesystems="${config.home.homeDirectory}/.themes/${config.gtk.theme.name}:ro"
      #
      #     [Environment]
      #     GTK_THEME=${config.gtk.theme.name}
      #   '';
    };
}
