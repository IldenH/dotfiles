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
      obsidian
      bottles
      pandoc
      zotero
      xournalpp
      calibre
    ];

    home.file.".config/obsidian/obsidian.json".text = builtins.toJSON {
      vaults.vault = {
        path = "${config.home.homeDirectory}/dev/Vault";
        open = true;
      };
      frame = "hidden";
      disableGpu = true;
    };
  };
}
