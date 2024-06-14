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
    games.enable = true;
    other.enable = true;
    qt-gtk.enable = true;
    zathura.enable = true;

    locale = {
      main = "en_US.UTF-8";
      extra = "nb_NO.UTF-8";
      timeZone = "Europe/Oslo";
    };

    screenshots.enable = true;

    terminal = {
      enable = true;
      neovim.enable = true;
      cli.enable = true;
      zsh.enable = true;
    };

    hyprland.enable = true;
    hyprlock.enable = true;
    hypridle.enable = true;
    mako.enable = true;
    waybar.enable = true;
  };

  home.file.".ssh/id_ed25519.pub".text = secrets.ssh.desktop.public;
  home.file.".ssh/id_ed25519".text = secrets.ssh.desktop.private;
}
