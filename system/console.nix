{
  config,
  lib,
  pkgs,
  ...
}: {
  config.console = {
    keyMap = config.settings.locale.keyMap;
    colors = with config.hm.colorScheme.palette; [
      "${base00}" # black
      "${base08}" # red
      "${base0B}" # green
      "${base0A}" # yellow
      "${base0D}" # blue
      "${base0E}" # magenta
      "${base0C}" # cyan
      "${base05}" # gray
      "${base03}" # darkgray
      "${base08}" # lightred
      "${base0B}" # lightgreen
      "${base0A}" # lightyellow
      "${base0D}" # lightblue
      "${base0E}" # lightmagenta
      "${base0C}" # lightcyan
      "${base06}" # white
    ];
  };
}
