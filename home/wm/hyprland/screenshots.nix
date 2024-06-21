{
  config,
  pkgs,
  lib,
  ...
}: {
  options.settings.screenshots.enable = lib.mkEnableOption "screenshots";

  config = let
    args = "--notify --freeze";
    format = "%Y-%m-%d_%H-%M-%S.png";
    path.raw = "$HOME/Pictures/Screenshots/Raw";
    path.edited = "$HOME/Pictures/Screenshots/Edited";
    raw = "${path.raw}/$(date +\"${format}\")";
  in
    lib.mkIf config.settings.screenshots.enable {
      home.packages = with pkgs; [
        grim
        slurp
        grimblast
        swappy
        wl-clipboard
      ];

      home.file.".config/swappy/config".text = lib.generators.toINI {} {
        Default = {
          save_dir = path.edited;
          save_filename_format = format;
          show_panel = true;
          # early_exit = true; # Exit on export
        };
      };

      wayland.windowManager.hyprland.settings.bind = [
        "ALT SHIFT, E, exec, wl-paste | swappy -f -"
        "ALT SHIFT, S, exec, grimblast ${args} copysave area ${raw}"
        # "SUPER, S, exec, grimblast ${args} copysave active ${raw}"
        "SUPER ALT, S, exec, grimblast ${args} copysave output ${raw}"
        "SUPER SHIFT, S, exec, grimblast ${args} copysave screen ${raw}"
      ];

      xdg.userDirs.extraConfig = {
        XDG_SCREENSHOTSRAW_DIR = path.raw;
        XDG_SCREENSHOTSEDITED_DIR = path.edited;
      };
    };
}
