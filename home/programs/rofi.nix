# Stolen from https://github.com/danth/stylix/blob/2985ee9b2836a725b04628d24f934212b96eacbe/modules/rofi/hm.nix
{config, ...}: {
  programs.rofi = {
    font = "JetBrainsMono Nerd Font 18";
    extraConfig = {
      display-drun = "";
      show-icons = true;
      disable-history = true;
      steal-focus = true;
      matching = "normal";
      replace = true;
      click-to-exit = true;
    };
    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
    in
      with config.colorScheme.palette; {
        "*" = {
          background = mkLiteral "#${base00}";
          foreground = mkLiteral "#${base06}";
          text = mkLiteral "#${base05}";

          separatorcolor = mkLiteral "@background";
          border-color = mkLiteral "@background";

          selected-text = mkLiteral "#${base06}";
          selected-background = mkLiteral "#${base01}";

          background-color = mkLiteral "@background";
        };

        window.background-color = mkLiteral "@background";
        textbox.text-color = mkLiteral "@text";

        message.border-color = mkLiteral "@separatorcolor";
        listview.border-color = mkLiteral "@separatorcolor";

        element-text = {
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
        };

        element-icon = {
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
          size = mkLiteral "1.5em";
        };

        "element normal.normal" = {
          background-color = mkLiteral "@background";
          text-color = mkLiteral "@text";
        };

        "element selected.normal" = {
          background-color = mkLiteral "@selected-background";
          text-color = mkLiteral "@selected-text";
        };

        "element alternate.normal" = {
          background-color = mkLiteral "@background";
          text-color = mkLiteral "@text";
        };

        scrollbar.handle-color = mkLiteral "@foreground";
        sidebar.border-color = mkLiteral "@separatorcolor";

        button.text-color = mkLiteral "@text";
        "button selected" = {
          background-color = mkLiteral "@selected-background";
          text-color = mkLiteral "@selected-text";
        };

        inputbar.text-color = mkLiteral "@text";
        case-indicator.text-color = mkLiteral "@text";
        entry.text-color = mkLiteral "@text";
        prompt.text-color = mkLiteral "@text";

        textbox-prompt-colon.text-color = mkLiteral "inherit";
      };
  };
}
