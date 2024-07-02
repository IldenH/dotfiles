{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: let
  nvim = inputs.nixvim-config.packages."${pkgs.system}".default; # broken for some reason
in {
  options.settings.neovim.enable = lib.mkEnableOption "neovim";

  config = lib.mkIf config.settings.neovim.enable {
    home.packages = [
      # nvim
      pkgs.nvimpager
    ];

    home.sessionVariables = {
      EDITOR = "nvim";
      PAGER = "nvimpager";
    };

    home.shellAliases.nvim = "nix run $HOME/nixvim"; # TODO: temporary solution

    # xdg.desktopEntries.nvim = {
    #   name = "Neovim";
    #   genericName = "Text Editor";
    #   icon = "nvim";
    #   exec = "${lib.getExe config.programs.kitty.package} -e ${lib.getExe nvim} %f";
    # };

    # xdg.mimeApps.defaultApplications = {
    #   "text/*" = "nvim.desktop";
    #   "text/plain" = "nvim.desktop";
    #   "application/x-shellscript" = "nvim.desktop";
    # };
  };
}
