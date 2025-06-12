{config, ...}: {
  programs.qutebrowser = {
    settings = {
      colors = import ./colors.nix {inherit config;};
    };
  };
}
