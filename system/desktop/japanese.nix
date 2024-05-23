{
  config,
  pkgs,
  lib,
  ...
}: {
  options.settings.japanese.enable = lib.mkEnableOption "japanese";

  config = lib.mkIf (config.settings.japanese.enable) {
    fonts.packages = with pkgs; [
      carlito
      dejavu_fonts
      ipafont
      kochi-substitute
      source-code-pro
      ttf_bitstream_vera
    ];

    fonts.fontconfig.defaultFonts = {
      monospace = [
        "DejaVu Sans Mono"
        "IPAGothic"
      ];
      sansSerif = [
        "DejaVu Sans"
        "IPAPGothic"
      ];
      serif = [
        "DejaVu Serif"
        "IPAPMincho"
      ];
    };

    i18n.inputMethod = {
      enabled = "fcitx5";
      fcitx5.addons = with pkgs; [
        fcitx5-mozc
        fcitx5-gtk
      ];
      fcitx5.waylandFrontend = true;
      fcitx5.settings = {
        globalOptions = {
          "Hotkey/TriggerKeys"."0" = "Alt+Shift+Z";
          "Behavior" = {
            "ActiveByDefault" = "True";
            "ShareInputState" = "All";
          };
        };
        inputMethod = {
          "GroupOrder"."0" = "Default";
          "Groups/0" = {
            "Name" = "Default";
            "Default Layout" = "no";
            "DefaultIM" = "mozc";
          };
          "Groups/0/Items/0" = {
            "Name" = "keyboard-no";
            "Layout" = "no";
          };
          "Groups/0/Items/1" = {
            "Name" = "mozc";
            "Layout" = "no";
          };
        };
        addons = with config.hm.colorScheme.palette; {
          "classicui"."globalSection" = {
            "TrayOutlineColor" = "#${base00}";
            "TrayTextColor" = "#${base05}";
            "PreferTextIcon" = "True";
            "Theme" = "default-dark";
          };
        };
      };
    };
  };
}
