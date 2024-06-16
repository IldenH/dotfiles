{secrets, ...}: {
  imports = [../../home];

  settings = {
    desktop.enable = true;

    discord.enable = true;
    other.enable = true;
  };

  home.file.".ssh/id_ed25519.pub".text = secrets.ssh.e14.public;
  home.file.".ssh/id_ed25519".text = secrets.ssh.e14.private;
}
