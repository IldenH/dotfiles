{
  inputs,
  global,
  pkgs,
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
    ./laptop.nix
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

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    corefonts
    vistafonts
  ];

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;
}
