{
  config,
  lib,
  inputs,
  ...
}: {
  options.settings.desktop.enable = lib.mkEnableOption "desktop";

  config = lib.mkIf config.settings.desktop.enable (lib.mkDefault {
    colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-medium;

    programs = {
      firefox.enable = true;
      hyprlock.enable = true;
      kitty.enable = true;
      waybar.enable = true;
      zathura.enable = true;
      zsh.enable = true;
    };

    services = {
      hypridle.enable = true;
      mako.enable = true;
    };

    settings = {
      wallpaper = ../assets/wallpaper.png;

      locale = {
        main = "en_US.UTF-8";
        extra = "nb_NO.UTF-8";
        timeZone = "Europe/Oslo";
      };

      screenshots.enable = true;

      neovim.enable = true;
      cli.enable = true;

      qt-gtk.enable = true;
      hyprland.enable = true;
    };
  });
}
