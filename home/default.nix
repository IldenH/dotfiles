{
  inputs,
  global,
  pkgs,
  lib,
  config,
  ...
}: {
  home = {
    username = "${global.user.name}";
    homeDirectory = "/home/${config.home.username}";
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

  home.file."colorscheme.txt".text = lib.concatStringsSep "\n" (
    lib.mapAttrsToList (name: value: "${name}: #${value}") config.colorScheme.palette
  );

  xdg.mimeApps.enable = true;
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    desktop = "$HOME";
    publicShare = null;
    templates = null;
  };

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    corefonts
    vistafonts
  ];

  programs.home-manager.enable = true;
}
