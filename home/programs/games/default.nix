{
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./factorio.nix
    ./heroic
  ];

  options.settings.games.enable = lib.mkEnableOption "games";

  config = lib.mkIf config.settings.games.enable {
    home.packages = with pkgs; [
      (prismlauncher.override {
        jdks = [
          temurin-bin-8
          temurin-bin-17
          temurin-bin-21
        ];
      })
    ];

    home.file.".local/share/PrismLauncher/prismlauncher.cfg".text = lib.generators.toINI {} {
      General = {
        ApplicationTheme = "system";
        EnableFeralGamemode = true;
        IconTheme = "flat_white";
        IgnoreJavaCompatibility = true;
        IgnoreJavaWizard = true;
        JavaPath = lib.getExe pkgs.temurin-bin-8;
        Language = "ja";
        MaxMemAlloc = 12544;
        MinMemAlloc = 512;
        TheCat = false;
      };
    };
  };
}
