{
  config,
  lib,
  ...
}: {
  options.settings.mako.enable = lib.mkEnableOption "mako";

  config.services.mako = with config.colorScheme.palette;
    lib.mkIf (config.settings.mako.enable) {
      enable = true;
      backgroundColor = "#${base01}";
      borderColor = "#${base0E}";
      borderRadius = 5;
      borderSize = 1;
      textColor = "#${base04}";
      layer = "overlay";
      defaultTimeout = 2500;
    };
}
