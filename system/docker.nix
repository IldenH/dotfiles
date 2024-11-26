_: {
  virtualisation.docker = {
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
    daemon.settings.data-root = "/var/lib/docker";
  };
}
