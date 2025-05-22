{config, ...}: {
  programs.hyprlock.settings = with config.colorScheme.palette; {
    general = {
      ignore_empty_input = true;
      fail_timeout = 0;
    };
    animations.enabled = false;
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

        inner_color = "rgba(0, 0, 0, 0.0)";
        font_color = "rgb(${base07})";
        check_color = "rgb(${base08})";
        fail_color = "rgb(${base08})";

        rounding = 5;
        outline_thickness = 0;
        placeholder_text = "";
        fail_text = "";
        fade_on_empty = false;
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
