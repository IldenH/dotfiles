{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf (config.settings.terminal.cli.enable) {
    # TODO: somehow use eza icons instead for consistency
    # https://github.com/eza-community/eza/blob/main/src/output/icons.rs
    home.file.".config/lf/icons".source = ./lf-icons;
    programs.lf = {
      enable = true;
      settings = {
        preview = true;
        hidden = true;
        icons = true;
        ignorecase = true;
      };

      commands = {
        mkdir =
          /*
          bash
          */
          ''
            ''${{
              printf "Directory Name: "
              read DIR
              mkdir -p $DIR
            }}
          '';
      };

      # defaults: https://github.com/gokcehan/lf/blob/master/doc.md
      keybindings = {
        c = "mkdir";
        "." = "set hidden!";
        "<esc>" = "quit";
      };

      extraConfig = let
        previewer = pkgs.writeShellScriptBin "pv.sh" ''
          file=$1
          w=$2
          h=$3
          x=$4
          y=$5

          if [[ "$( ${pkgs.file}/bin/file -Lb --mime-type "$file")" =~ ^image ]]; then
              ${pkgs.kitty}/bin/kitty +kitten icat --silent --stdin no --transfer-mode file --place "''${w}x''${h}@''${x}x''${y}" "$file" < /dev/null > /dev/tty
              exit 1
          fi

          ${pkgs.pistol}/bin/pistol "$file"
        '';
        cleaner = pkgs.writeShellScriptBin "clean.sh" ''
          ${pkgs.kitty}/bin/kitty +kitten icat --clear --stdin no --silent --transfer-mode file < /dev/null > /dev/tty
        '';
      in ''
        set cleaner ${cleaner}/bin/clean.sh
        set previewer ${previewer}/bin/pv.sh
      '';
    };
  };
}
