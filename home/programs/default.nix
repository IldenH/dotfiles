{
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    # ./anki.nix
    ./firefox
    ./discord
    ./heroic
    ./files.nix
    ./school.nix
    ./qalculate.nix
    ./zathura.nix
  ];

  options.settings = {
    games.enable = lib.mkEnableOption "games";
    media.enable = lib.mkEnableOption "imageviewer and videoviewer";
    other.enable = lib.mkEnableOption "other";
  };

  config = lib.mkMerge [
    (lib.mkIf config.settings.games.enable {
      home.packages = with pkgs; [
        adwsteamgtk
        # lutris
        (prismlauncher.override {
          jdks = [
            temurin-bin-8
            # temurin-bin-17
            # temurin-bin-21
          ];
        })
      ];

      home.file.".local/share/PrismLauncher/prismlauncher.cfg".text = lib.generators.toINI {} {
        General = {
          ApplicationTheme = "system";
          EnableFeralGamemode = true;
          IconTheme = "flat_white";
          IgnoreJavaCompatibility = true;
          IgnoreJavaWizard = true;
          JavaPath = lib.getExe pkgs.temurin-bin-8;
          Language = "ja";
          MaxMemAlloc = 12544;
          MinMemAlloc = 512;
          TheCat = false;
        };
      };
    })
    (lib.mkIf config.settings.media.enable {
      home.packages = [pkgs.pix];

      programs.mpv.enable = true;

      xdg.mimeApps.defaultApplications = {
        "image/*" = "pix.desktop";
        "video/*" = "mpv.desktop";
      };
    })
    (lib.mkIf config.settings.other.enable {
      home.packages = with pkgs; [
        anki-bin
        krita
        python311
      ];

      settings = {
        media.enable = lib.mkDefault true;
        files.enable = lib.mkDefault true;
      };
    })
  ];
}
