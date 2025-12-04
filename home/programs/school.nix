{
  pkgs,
  lib,
  config,
  ...
}: {
  options.settings.school.enable = lib.mkEnableOption "school related programs";

  config = lib.mkIf config.settings.school.enable {
    home.packages = with pkgs; [
      teams-for-linux
      libreoffice
      temurin-jre-bin-17
      geogebra6
      bottles
      pandoc
      zotero
      xournalpp
      calibre
      kiwix
      arduino
      freecad
      kicad
      jiten
      ffmpeg
    ];

    xdg.desktopEntries.teams-for-linux = {
      name = "Microsoft Teams";
      icon = "teams";
      exec = "teams-for-linux --disableGpu";
    };

    xdg.desktopEntries.geogebra = {
      name = "Geogebra";
      icon = "geogebra";
      exec = "geogebra --disable-gpu";
    };
  };
}
