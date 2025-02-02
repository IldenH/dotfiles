{
  global,
  secrets,
  ...
}: {
  services.syncthing = let
    home = "/home/${global.user.name}";

    mkDevice = device: {
      id = device.id;
      autoAcceptFolders = true;
    };
  in {
    user = global.user.name;
    dataDir = "${home}";
    configDir = "${home}/.config/syncthing";
    databaseDir = "${home}/.cache/syncthing";
    openDefaultPorts = true;
    settings = {
      options = {
        urAccepted = -1;
        relaysEnabled = true;
      };
      gui = {
        user = global.user.name;
        password = secrets.password;
      };
      devices = with secrets.syncthing; {
        desktop = mkDevice desktop;
        e14 = mkDevice e14;
      };
      folders = {
        "~/Sync".devices = [
          "desktop"
          "e14"
        ];
        "~/.local/share/Anki2".devices = [
          "desktop"
          "e14"
        ];
        "~/dev".devices = [
          "desktop"
          "e14"
        ];
        "~/.config/mozc".devices = [
          "desktop"
          "e14"
        ];
        "~/.spell".devices = [
          "desktop"
          "e14"
        ];
        "~/.zotero".devices = [
          "desktop"
          "e14"
        ];
        "~/Zotero".devices = [
          "desktop"
          "e14"
        ];
        "~/.config/libreoffice".devices = [
          "desktop"
          "e14"
        ];
        "~/Calibre Library".devices = [
          "desktop"
          "e14"
        ];
        "~/.config/calibre".devices = [
          "desktop"
          "e14"
        ];
      };
    };
  };
}
