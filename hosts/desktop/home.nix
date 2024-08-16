{secrets, ...}: {
  imports = [../../home];

  settings = {
    desktop.enable = true;

    discord.enable = true;
    games.enable = true;
    school.enable = true;
    other.enable = true;
  };

  home.file.".ssh/id_ed25519.pub".text = secrets.ssh.desktop.public;
  home.file.".ssh/id_ed25519".text = secrets.ssh.desktop.private;
}
