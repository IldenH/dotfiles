{
  config,
  lib,
  inputs,
  ...
}: {
  options.settings.desktop.enable = lib.mkEnableOption "desktop";

  config = lib.mkIf config.settings.desktop.enable (lib.mkDefault {
    colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-medium;

    settings = {
      wallpaper = ../assets/wallpaper.png;

      locale = {
        main = "en_US.UTF-8";
        extra = "nb_NO.UTF-8";
        timeZone = "Europe/Oslo";
      };

      browser.enable = true;
      screenshots.enable = true;
      zathura.enable = true;

      terminal = {
        enable = true;
        neovim.enable = true;
        cli.enable = true;
        zsh.enable = true;
      };

      qt-gtk.enable = true;
      hyprland.enable = true;
      hyprlock.enable = true;
      hypridle.enable = true;
      mako.enable = true;
      waybar.enable = true;
    };
  });
}
