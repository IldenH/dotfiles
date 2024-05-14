{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  options.settings.terminal.neovim.enable = lib.mkEnableOption "neovim";

  config = lib.mkIf (config.settings.terminal.neovim.enable) {
    home.packages = [
      inputs.nixvim-config.packages."${pkgs.system}".nvim
      pkgs.nvimpager
    ];

    home.sessionVariables = {
      EDITOR = "nvim";
      PAGER = "nvimpager";
    };

    xdg.desktopEntries.nvim = {
      name = "Neovim";
      genericName = "Text Editor";
      icon = "nvim";
      exec = "${lib.getExe config.programs.kitty.package} -e ${lib.getExe config.programs.neovim.package} %f";
    };

    xdg.mimeApps.defaultApplications = {
      "text/*" = "nvim.desktop";
      "text/plain" = "nvim.desktop";
      "application/x-shellscript" = "nvim.desktop";
    };
  };
}
