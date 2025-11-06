{
  config,
  pkgs,
  lib,
  inputs,
  secrets,
  ...
}: let
  nvim = inputs.nvf-config.packages.${pkgs.stdenv.hostPlatform.system}.default;
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
      "text/plain" = "nvim.desktop";
      "application/x-shellscript" = "nvim.desktop";
      "application/x-docbook+xml" = "nvim.desktop";
      "application/json" = "nvim.desktop";
      "application/x-yaml" = "nvim.desktop";
      "application/x-ruby" = "nvim.desktop";
    };
  };
}
