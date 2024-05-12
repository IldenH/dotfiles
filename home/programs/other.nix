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
