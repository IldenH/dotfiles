{
  config,
  lib,
  pkgs,
  ...
}: {
  options.settings.laptop.enable = lib.mkEnableOption "laptop";

  config = lib.mkIf config.settings.laptop.enable {
    home.packages = with pkgs; [
      brightnessctl
      pavucontrol
    ];

    wayland.windowManager.hyprland.settings = {
      bindl = [
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];
      bindle = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 10%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 10%-"

        ", XF86MonBrightnessUp, exec, brightnessctl set 15%+"
        ", XF86MonBrightnessDown, exec, brightnessctl set 15%-"
      ];
    };
  };
}
