{
  inputs,
  global,
  ...
}: {
  home = {
    username = "${global.user.name}";
    homeDirectory = "/home/${global.user.name}";
    stateVersion = "23.11";
  };

  imports = [
    inputs.nix-colors.homeManagerModules.default

    ./desktop.nix
    ./impermanence.nix
    ./locale.nix
    ./programs
    ./shell
    ./wm
  ];

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    desktop = null;
    publicShare = null;
    templates = null;
  };

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;
}
