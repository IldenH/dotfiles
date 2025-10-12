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
        IconTheme = "flat_white";
        Language = "ja";
        TheCat = false;

        EnableFeralGamemode = true;

        UseNativeGLFW = true;
        CustomGLFWPath = "/run/opengl-driver/lib/libglfw.so";
        UseZink = true;

        IgnoreJavaCompatibility = true;
        IgnoreJavaWizard = true;
        JavaPath = lib.getExe pkgs.temurin-bin-8;
        AutomaticJavaSwitch = true;

        MaxMemAlloc = 12544;
        MinMemAlloc = 512;
      };
    };
  };
}
