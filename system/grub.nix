{
  config,
  global,
  lib,
  ...
}: {
  boot.loader = {
    efi.canTouchEfiVariables = true;
    timeout = 1;
    limine = {
      enable = true;
      style = let
        colors = config.console.colors;
        half = builtins.length colors / 2;
        colors' = lib.lists.sublist 0 half config.console.colors;
        brightColors = lib.lists.sublist half half config.console.colors;
      in {
        wallpapers = [../assets/wallpaper.png];
        interface.brandingColor = 5;
        interface.branding = global.user.description;
        graphicalTerminal.palette = lib.strings.concatStringsSep ";" colors';
        graphicalTerminal.brightPalette = lib.strings.concatStringsSep ";" brightColors;
      };
    };
  };
}
