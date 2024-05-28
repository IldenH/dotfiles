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
    # espanso.enable = true; # service doesn't run properly
    games.enable = true;
    nightlight.enable = false; # doesn't work with Nvida 535, using monitor's builtin nightlight
    other.enable = true;
    qt-gtk-themes.enable = true;
    zathura.enable = true;

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

  home.file.".ssh/id_ed25519.pub".text = secrets.ssh.desktop.public;
  home.file.".ssh/id_ed25519".text = secrets.ssh.desktop.private;
}
