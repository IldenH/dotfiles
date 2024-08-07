{config, ...}: {
  programs.hyprlock.settings = with config.colorScheme.palette; {
    general = {
      disable_loading_bar = true;
      no_fade_in = true;
      no_fade_out = true;
      ignore_empty_input = true;
    };
    background = [
      {
        path = "${config.settings.wallpaper}";

        blur_passes = 1;
        blur_size = 0;
        noise = 0.0;
        contrast = 1.0;
        brightness = 0.8;
        vibrancy = 0.1;
        vibrancy_darkness = 0.0;
      }
    ];
    input-field = [
      {
        size = "350, 30";

        inner_color = "rgb(${base01})";
        font_color = "rgb(${base07})";
        check_color = "rgb(${base01})";
        fail_color = "rgb(${base08})";

        rounding = 5;
        outline_thickness = 0;
        placeholder_text = "";
        fail_text = "";
        fade_on_empty = false;
        fail_transition = 50;
      }
    ];
    label = [
      {
        text = "$TIME";
        color = "rgb(${base07})";
        font_size = 48;
        position = "0, 160";
        halign = "center";
        valign = "center";
      }
      {
        text = "cmd[update:1000] date +'%A %d. %B %Y'";
        color = "rgb(${base07})";
        font_size = 16;
        position = "0, 80";
        halign = "center";
        valign = "center";
      }
    ];
  };
}
