{
  config,
  lib,
  ...
}: {
  options.settings.espanso.enable = lib.mkEnableOption "espanso";

  config.services.espanso = lib.mkIf (config.settings.espanso.enable) {
    enable = true;
    matches = {
      default = {
        matches = [
          {
            trigger = ":Hi:";
            replace = "Hello, World!";
          }
        ];
      };
    };
  };
}
