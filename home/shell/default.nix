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
      pdftk
      fd
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
      enableDefaultConfig = false;
      extraConfig = "SetEnv TERM=xterm-256color";
      settings =
        import ../../secrets/ssh-hosts.nix
        // {
          "*" = {
            ForwardAgent = false;
            AddKeysToAgent = "no";
            Compression = false;
            ServerAliveInterval = 0;
            ServerAliveCountMax = 3;
            HashKnownHosts = false;
            UserKnownHostsFile = "~/.ssh/known_hosts";
            ControlMaster = "no";
            ControlPath = "~/.ssh/master-%r@%n:%p";
            ControlPersist = "no";
          };
        };
    };

    programs.zellij.enable = true;
    home.file.".config/zellij/config.kdl".text = import ./zellij.nix {inherit config;};

    home.shellAliases = {
      cat = "bat";

      regen = "sudo /nix/var/nix/gcroots/current-system/activate && ~/.local/state/home-manager/gcroots/current-home/activate";

      bigfiles = "sudo fd --one-file-system --base-directory / --type f --exec du -h {} + 2>/dev/null | sort -rh | head -n 10";

      lastcam = ''\ls ${config.home.homeDirectory}/Pictures/DCIM/Camera --sort=time | head -n 1 | xargs -I {} pix "${config.home.homeDirectory}/Pictures/DCIM/Camera/{}"'';
      lastscreen = ''\ls ${config.home.homeDirectory}/Pictures/Screenshots/Raw --sort=time | head -n 1 | xargs -I {} pix "${config.home.homeDirectory}/Pictures/Screenshots/Raw/{}"'';
    };
  };
}
