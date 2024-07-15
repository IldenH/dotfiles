{
  global,
  secrets,
  ...
}: {
  services.syncthing = let
    home = "/home/${global.user.name}";
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
      devices = {
        desktop.id = secrets.syncthing.desktop;
      };
      folders = {
        "Sync" = {
          path = "~/Sync";
          devices = [
            "desktop"
          ];
        };
      };
    };
  };
}
