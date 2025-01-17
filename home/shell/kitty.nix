{
  lib,
  config,
  pkgs,
  ...
}: {
  config = lib.mkIf config.programs.kitty.enable {
    home.packages = [pkgs.nerd-fonts.jetbrains-mono];
    programs.kitty = {
      shellIntegration.mode = "no-cursor";
      font = {
        name = "JetBrains Mono Nerd Font";
        size = 11.5;
      };
      settings = with config.colorScheme.palette; {
        scrollback_lines = 1000;
        scrollback_indicator_opacity = 0;
        enable_audio_bell = false;
        background_opacity = "0.95";

        hide_window_decorations = true;
        remember_window_size = false;
        confirm_os_window_close = 0;

        foreground = "#${base06}";
        background = "#${base00}";
        selection_foreground = "#${base05}";
        selection_background = "#${base02}";
        cursor = "#${base06}";
        cursor_text_color = "#${base00}";

        # Black
        color0 = "#${base00}";
        color8 = "#${base04}";
        # Red
        color1 = "#${base08}";
        color9 = "#${base08}";
        # Green
        color2 = "#${base0B}";
        color10 = "#${base0B}";
        # Yellow
        color3 = "#${base0A}";
        color11 = "#${base0A}";
        # Blue
        color4 = "#${base0D}";
        color12 = "#${base0D}";
        # Magenta
        color5 = "#${base0E}";
        color13 = "#${base0E}";
        # Cyan
        color6 = "#${base0C}";
        color14 = "#${base0C}";
        # White
        color7 = "#${base06}";
        color15 = "#${base06}";
      };
    };
  };
}
