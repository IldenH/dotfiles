{
  config,
  pkgs,
  lib,
  ...
}: {
  options.settings.sddm.image = lib.mkOption {
    type = lib.types.path;
    default = null;
  };

  config = lib.mkIf (config.settings.sddm.image != null) {
    services.xserver.enable = true;

    services.displayManager = {
      sddm.enable = true;
      sddm.wayland.enable = true;
      sddm.theme = "${import ./theme.nix {inherit pkgs config;}}";
    };

    # sddm-theme
    environment.systemPackages = with pkgs.libsForQt5.qt5; [
      qtquickcontrols2
      qtgraphicaleffects
    ];
  };
}
