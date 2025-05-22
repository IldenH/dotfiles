{secrets, ...}: {
  imports = [../../home];

  settings = {
    desktop.enable = true;
    laptop.enable = true;

    nightlight.enable = true;
    discord.enable = true;
    school.enable = true;
    other.enable = true;
  };

  home.file.".ssh/id_ed25519.pub".text = secrets.ssh.e14.public;
  home.file.".ssh/id_ed25519".text = secrets.ssh.e14.private;

  home.file.".config/syncthing/cert.pem".text = secrets.syncthing.e14.cert;
  home.file.".config/syncthing/key.pem".text = secrets.syncthing.e14.key;
}
