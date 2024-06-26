{
  pkgs,
  lib,
  config,
  ...
}: let
  colorScheme = lib.generators.toINI {} {
    ColorScheme = let
      mkScheme = colors: lib.concatStringsSep ", " (map (color: "#ff${color}") colors);
    in
      with config.colorScheme.palette; {
        active_colors = mkScheme [
          base06 # Window text
          base00 # Button background
          base06 # Bright
          base05 # Less bright
          base01 # Dark
          base02 # Less dark
          base06 # Normal text
          base07 # Bright text
          base06 # Button text
          base00 # Normal background
          base00 # Window
          base00 # Shadow
          base02 # Highlight
          base05 # Highlighted text
          base05 # Link
          base0E # Visited link
          base01 # Alternate background
          base01 # Default
          base01 # Tooltip background
          base06 # Tooltip text
          base05 # Placeholder text
        ];

        inactive_colors = mkScheme [
          base04 # Window text
          base00 # Button background
          base05 # Bright
          base04 # Less bright
          base01 # Dark
          base02 # Less dark
          base04 # Normal text
          base05 # Bright text
          base04 # Button text
          base00 # Normal background
          base00 # Window
          base00 # Shadow
          base02 # Highlight
          base05 # Highlighted text
          base05 # Link
          base0E # Visited link
          base01 # Alternate background
          base01 # Default
          base01 # Tooltip background
          base05 # Tooltip text
          base04 # Placeholder text
        ];

        disabled_colors = mkScheme [
          base04 # Window text
          base00 # Button background
          base04 # Bright
          base03 # Less bright
          base00 # Dark
          base01 # Less dark
          base04 # Normal text
          base05 # Bright text
          base04 # Button text
          base00 # Normal background
          base00 # Window
          base00 # Shadow
          base02 # Highlight
          base05 # Highlighted text
          base05 # Link
          base0E # Visited link
          base01 # Alternate background
          base01 # Default
          base01 # Tooltip background
          base04 # Tooltip text
          base03 # Placeholder text
        ];
      };
  };

  baseConfig = {
    Appearance = {
      color_scheme_path = "$HOME/.config/qt5ct/colors/${config.colorScheme.slug}.conf";
      custom_palette = true;
      icon_theme = config.gtk.iconTheme.name;
      standard_dialogs = "default";
      style = "Adwaita-Dark";
    };

    Troubleshooting = {
      force_raster_widgets = 1;
      ignored_applications = "@Invalid()";
    };

    Interface = {
      cursor_flash_time = 1200;
      double_click_interval = 400;
      menus_have_icons = true;
      show_shortcuts_in_context_menus = true;
      gui_effects = "@Invalid()";
      stylesheets = "@Invalid()";
      buttonbox_layout = 3; # gnome dialog button layout

      # follow application
      toolbutton_style = 4;
      activate_item_on_single_click = 1;
      dialog_buttons_have_icons = 1;
      underline_shortcut = 1;

      wheel_scroll_lines = 3;
      keyboard_scheme = 2; # x11
    };
  };
in {
  config = lib.mkIf config.settings.qt-gtk.enable {
    qt = {
      enable = true;
      platformTheme.name = "qtct";
      style.package = with pkgs; [adwaita-qt adwaita-qt6];
    };

    home.packages = with pkgs; [
      libsForQt5.qt5.qtwayland
      kdePackages.qtwayland
    ];

    home.file = {
      ".config/qt5ct/colors/${config.colorScheme.slug}.conf".text = colorScheme;
      ".config/qt6ct/colors/${config.colorScheme.slug}.conf".text = colorScheme;

      ".config/qt5ct/qt5ct.conf".text = lib.generators.toINI {} baseConfig;
      ".config/qt6ct/qt6ct.conf".text = lib.generators.toINI {} baseConfig;
    };
  };
}
