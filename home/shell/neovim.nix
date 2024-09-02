{
  config,
  pkgs,
  lib,
  inputs,
  secrets,
  ...
}: let
  nvim = inputs.nixvim-config.packages.${pkgs.system}.default;
in {
  options.settings.neovim.enable = lib.mkEnableOption "neovim";

  config = lib.mkIf config.settings.neovim.enable {
    home.packages = [
      nvim
      pkgs.nvimpager
    ];

    home.sessionVariables = {
      EDITOR = "nvim";
      PAGER = "nvimpager";

      OBSIDIAN_REST_API_KEY = secrets.obsidian;
    };

    xdg.desktopEntries.nvim = {
      name = "Neovim";
      genericName = "Text Editor";
      icon = "nvim";
      exec = "${lib.getExe config.programs.kitty.package} -e ${lib.getExe nvim} %f";
    };

    xdg.mimeApps.defaultApplications = {
      "text/*" = "nvim.desktop";
      "text/plain" = "nvim.desktop";
      "application/x-shellscript" = "nvim.desktop";
    };
  };
}
