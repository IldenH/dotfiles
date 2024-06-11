{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./git.nix
    ./lf.nix
    ./neofetch.nix
    ./neovim.nix
    ./terminal.nix
    ./zsh.nix
  ];
  options.settings.terminal.cli.enable = lib.mkEnableOption "cli";

  config = lib.mkIf config.settings.terminal.cli.enable {
    home.packages = with pkgs; [
      tldr
      sops
      file
    ];

    programs.bat = {
      enable = true;
      config.theme = "base16";
    };

    programs.eza = {
      enable = true;
      git = true;
      icons = true;
      extraOptions = [
        "--color=always"
        "--group-directories-first"
        "--header"
        "--no-quotes"
        "--hyperlink"
        # "--total-size" # takes awhile to run
      ];
    };

    programs.fzf = {
      enable = true;
      defaultOptions = ["--color 16"];
    };

    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    programs = {
      navi.enable = true; # TODO: find good cheatsheets
      ripgrep.enable = true;
      thefuck.enable = true;
      zoxide.enable = true;
    };

    home.shellAliases = {
      cat = "bat";
      cd = "z";
      cls = "clear && neofetch && ls";
      c = ''cd $(find . -type d -not -path " * /. * " -not -path "." | fzf -m)'';
    };
  };
}
