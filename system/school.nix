{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.hm.settings.school.enable {
    services.languagetool.enable = true;
    services.languagetool.port = 18081;
  };
}
