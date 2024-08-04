{
  lib,
  config,
  pkgs,
  ...
}: {
  options.settings.sound.enable = lib.mkEnableOption "sound";

  config = lib.mkMerge [
    (lib.mkIf config.settings.sound.enable {
      security.rtkit.enable = true;
      services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
      };
    })

    (lib.mkIf config.services.printing.enable {
      services.avahi = {
        enable = true;
        nssmdns4 = true;
        openFirewall = true;
      };

      environment.systemPackages = with pkgs; [
        hplip
      ];

      services.printing.drivers = with pkgs; [
        hplipWithPlugin
      ];
    })
  ];
}
