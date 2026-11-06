{
  config,
  pkgs,
  lib,
  ...
}: {
  options.settings = {
    hyprland.enable = lib.mkEnableOption "hyprland";
    wallpaper = lib.mkOption {type = lib.types.path;};
  };

  imports = [
    ./screenshots.nix
  ];

  config = lib.mkIf config.settings.hyprland.enable {
    home.packages = with pkgs; [
      libnotify
      nwg-displays
      seatd
      swaybg
    ];

    home.file.".config/hypr/hyprland.lua".source = builtins.toFile "hyprland.lua" (
      # lua
      ''
        local browser    = "firefox"
        local calculator = "bash -c 'pgrep qalculate-gtk && hyprctl dispatch togglespecialworkspace calculator || qalculate-gtk &'"
        local discord    = "vesktop"
        local files      = "nemo"
        local launcher   = "rofi -show drun"
        local screenrec  = "wl-screenrec-daemon --toggle"
        local swapMouse  = "if [[ $(hyprctl -j getoption input.left_handed | jq '.int // .bool') == 'false' ]]; then hyprctl eval 'hl.config({input={left_handed=true}})'; else hyprctl eval 'hl.config({input={left_handed=false}})'; fi"
        local terminal   = "kitty"
        local wallpaper = "${config.settings.wallpaper}"
        local active_border_colors = {"rgba(${config.colorScheme.palette.base02}ee)", "rgba(${config.colorScheme.palette.base03}ee)"}
        local inactive_border = "rgba(${config.colorScheme.palette.base00}aa)"

        local monitors = {"desc:Samsung Electric Company S24F350 H4ZJ701847", "desc:Samsung Electric Company S24F350 H4ZMA03168"}
      ''
      + builtins.readFile ./hyprland.lua
    );
  };
}
