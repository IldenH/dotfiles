{
  lib,
  config,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.settings.school.enable {
    services.languagetool.enable = true;
    services.languagetool.port = 18081;

    # https://freedict.org/downloads/#dictionary-downloads
    services.dictd.enable = true;
    services.dictd.DBs = with pkgs.dictdDBs; [wordnet wiktionary];

    services.libretranslate = {
      enable = true;
    };
  };
}
