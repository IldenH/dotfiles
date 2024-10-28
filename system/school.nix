{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.hm.settings.school.enable {
    services.languagetool.enable = true;
  };
}
