{
  inputs,
  secrets,
  ...
}: {
  imports = [../../home];

  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-medium;

  settings = {
    wallpaper = ../wallpaper.png;

    browser.enable = true;
    discord.enable = true;
    other.enable = true;
    qt-gtk-themes.enable = true;
    zathura.enable = true;

    locale = {
      main = "en_US.UTF-8";
      extra = "nb_NO.UTF-8";
      timeZone = "Europe/Oslo";
    };

    screenshots = {
      enable = true;
      format = "%Y-%m-%d_%H-%M-%S.png";
      path = {
        raw = "$HOME/Pictures/Screenshots/Raw";
        edited = "$HOME/Pictures/Screenshots/Edited";
      };
    };

    terminal = {
      enable = true;
      neovim.enable = true;
      cli.enable = true;
      zsh = {
        enable = true;
        theme = "simple";
      };
    };

    hyprland.enable = true;
    hyprlock.enable = true;
    hypridle.enable = true;
    mako.enable = true;
    waybar.enable = true;
  };
}
