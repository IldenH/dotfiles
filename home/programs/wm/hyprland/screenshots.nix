{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  options.settings.screenshots = {
    enable = lib.mkEnableOption "screenshots";
    format = lib.mkOption {
      type = lib.types.str;
      default = "%Y-%m-%d_%H-%M-%S.png";
    };
    path.raw = lib.mkOption {
      type = lib.types.str;
      default = "$HOME/Pictures/Screenshots/Raw";
    };
    path.edited = lib.mkOption {
      type = lib.types.str;
      default = "$HOME/Pictures/Screenshots/Edited";
    };
  };

  config = let
    args = "--notify --freeze";
    raw = "${config.settings.screenshots.path.raw}/$(date +\"${config.settings.screenshots.format}\")";
  in
    lib.mkIf (config.settings.screenshots.enable) {
      home.packages = with pkgs; [
        grim
        slurp
        grimblast
        swappy
        wl-clipboard
      ];

      # Configure swappy (screenshot annotation tool)
      home.file.".config/swappy/config".text = ''
        [Default]
        save_dir=${config.settings.screenshots.path.edited}
        save_filename_format=${config.settings.screenshots.format}
        show_panel=true
        # early_exit=true # Exit on export
      '';

      # Configure keybindings
      wayland.windowManager.hyprland.settings.bind = [
        "ALT SHIFT, E, exec, wl-paste | swappy -f -"
        "ALT SHIFT, S, exec, grimblast ${args} copysave area ${raw}"
        # "SUPER, S, exec, grimblast ${args} copysave active ${raw}"
        "SUPER ALT, S, exec, grimblast ${args} copysave output ${raw}"
        "SUPER SHIFT, S, exec, grimblast ${args} copysave screen ${raw}"
      ];

      # Create directories
      xdg.userDirs.extraConfig = {
        XDG_SCREENSHOTSRAW_DIR = config.settings.screenshots.path.raw;
        XDG_SCREENSHOTSEDITED_DIR = config.settings.screenshots.path.edited;
      };
    };
}
