{
  lib,
  config,
  pkgs,
  ...
}: {
  options.settings = {
    games.enable = lib.mkEnableOption "games";
    media.enable = lib.mkEnableOption "imageviewer and videoviewer";
    other.enable = lib.mkEnableOption "other";
  };

  config = lib.mkMerge [
    (lib.mkIf (config.settings.games.enable) {
      home.packages = with pkgs; [
        heroic
        # lutris
        prismlauncher
      ];

      home.file.".local/share/PrismLauncher/prismlauncher.cfg".text =
        /*
        bash
        */
        ''
          [General]
          ApplicationTheme=dark
          ConfigVersion=1.2
          EnableFeralGamemode=true
          IconTheme=flat_white
          IgnoreJavaCompatibility=true
          IgnoreJavaWizard=true
          # TODO: figure out which package this is in nixpkgs
          JavaPath=/nix/store/mrspaijbsp1gi69l45ifnqaa3wigjl6d-openjdk-8u362-ga/bin/java
          Language=en_US
          MaxMemAlloc=12544
          MinMemAlloc=512
          TheCat=false
        '';

      settings.steam.enable = lib.mkDefault true;
    })
    (lib.mkIf (config.settings.media.enable) {
      home.packages = [pkgs.cinnamon.pix];

      programs.mpv.enable = true;

      xdg.mimeApps.defaultApplications = {
        "image/*" = "pix.desktop";
        "video/*" = "mpv.desktop";
      };
    })
    (lib.mkIf (config.settings.other.enable) {
      home.packages = with pkgs; [
        anki-bin
        geogebra6
        krita
        python311
        qalculate-gtk
      ];

      settings = {
        media.enable = lib.mkDefault true;
        files.enable = lib.mkDefault true;
      };
    })
  ];
}
