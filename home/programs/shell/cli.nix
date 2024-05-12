{
  lib,
  config,
  pkgs,
  ...
}: {
  options.settings.terminal.cli.enable = lib.mkEnableOption "cli";

  config = lib.mkIf (config.settings.terminal.cli.enable) {
    home.packages = with pkgs; [
      tldr
    ];

    programs.git = {
      enable = true;
      userName = "IldenH";
      userEmail = "IldenH.1" + "@" + "proton.me";
      extraConfig = {
        init.defaultBranch = "main";
        credential.helper = "store"; # I should probably switch to ssh
      };
    };

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
      ripgrep.enable = true;
      thefuck.enable = true;
      zoxide.enable = true;
    };

    home.shellAliases = {
      cat = "bat";
      cd = "z";
      cdi = "zi";
      cls = "clear && neofetch && ls";

      makkergruppe = ''
        cat ~/Documents/T1/makkergruppe-nr2 | wl-copy && wl-paste && echo "Copied :)"'';
    };
  };
}
