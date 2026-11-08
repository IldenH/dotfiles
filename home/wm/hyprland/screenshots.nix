{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  options.settings.screenshots.enable = lib.mkEnableOption "screenshots";

  config = let
    args = "--notify --freeze";
    format = "%Y-%m-%d_%H-%M-%S.png";
    path.raw = "$HOME/Pictures/Screenshots/Raw";
    path.edited = "$HOME/Pictures/Screenshots/Edited";
    raw = "${path.raw}/$(date +\"${format}\")";

    languages = lib.concatStringsSep "\\n" [
      "English:eng"
      "Norwegian:nor"
      "German:deu"
      "Japanese:jpn"
      "French:fra"
      "Danish:dan"
      "Swedish:swe"
    ];
    language = ''echo -e "${languages}" | rofi -dmenu -window-title "" | cut -d ":" -f2'';
    ocr = ''focal image --selection --ocr $(${language})'';
  in
    lib.mkIf config.settings.screenshots.enable {
      home.packages = with pkgs; [
        grim
        slurp
        grimblast
        swappy
        wl-clipboard
        inputs.focal.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];

      home.file.".config/swappy/config".text = lib.generators.toINI {} {
        Default = {
          save_dir = path.edited;
          save_filename_format = format;
          show_panel = true;
          # early_exit = true; # Exit on export
        };
      };

      home.file.".config/hypr/screenshots.lua".text =
        # lua
        ''
          hl.bind("SUPER + S",         hl.dsp.exec_cmd('grimblast ${args} copysave area ${raw}'))
          hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd('grimblast ${args} copysave screen ${raw}'))
          hl.bind("SUPER + ALT + E",   hl.dsp.exec_cmd("wl-paste | swappy -f -"))
          hl.bind("SUPER + ALT + S",   hl.dsp.exec_cmd('${ocr} ${raw}'))

          -- https://github.com/LilleAila/dotfiles/commit/80ecf1847c3407a9931433ddda46736cbb31b2ba
          hl.bind("SUPER + Q", hl.dsp.exec_cmd('${lib.getExe pkgs.grim} -g "$(${lib.getExe pkgs.slurp})" - | ${lib.getExe' pkgs.zbar "zbarimg"} - -q --raw | wl-copy && notify-send "$(wl-paste)"'))
        '';

      xdg.userDirs.extraConfig = {
        SCREENSHOTSRAW = path.raw;
        SCREENSHOTSEDITED = path.edited;
      };
    };
}
