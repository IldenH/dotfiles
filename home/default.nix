{
  inputs,
  pkgs,
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

    ./programs/anki.nix
    ./programs/browser
    ./programs/discord
    # ./programs/espanso.nix # service doesn't run properly
    ./programs/files.nix
    ./programs/other.nix
    ./programs/shell
    ./programs/steam.nix
    ./programs/wm
    ./programs/zathura.nix
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
