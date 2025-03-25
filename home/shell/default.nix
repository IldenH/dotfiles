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
    ./kitty.nix
    ./zsh.nix
  ];
  options.settings.cli.enable = lib.mkEnableOption "various terminal utilities";

  config = lib.mkIf config.settings.cli.enable {
    home.packages = with pkgs; [
      tldr
      file
      nurl
      pdftk
    ];

    programs.bat = {
      enable = true;
      config.theme = "base16";
    };

    programs.eza = {
      enable = true;
      git = true;
      icons = "always";
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

    programs.translate-shell = {
      enable = true;
      settings = {
        interactive = true;
        indent = "2";

        show-original = false;
        show-original-dictionary = true;
        show-prompt-message = false;
        show-original-phonetics = false;
      };
    };

    programs.ripgrep.enable = true;

    programs.zoxide = {
      enable = true;
      options = ["--cmd cd"];
    };

    programs.ssh = {
      enable = true;
      extraConfig = "SetEnv TERM=xterm-256color";
      matchBlocks = import ../../secrets/ssh-hosts.nix;
    };

    home.shellAliases = {
      cat = "bat";
      cls = "clear && ls";
      c = ''cd $(find . -type d -not -path " * /. * " -not -path "." | fzf -m)'';

      regen = "sudo /nix/var/nix/gcroots/current-system/activate && ~/.local/state/home-manager/gcroots/current-home/activate";
    };
  };
}
