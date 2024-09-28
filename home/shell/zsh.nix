{
  lib,
  config,
  pkgs,
  ...
}: {
  config = lib.mkIf config.programs.zsh.enable {
    programs.zsh = {
      enableCompletion = true;
      # enableAutosuggestions = true;
      syntaxHighlighting.enable = true;
      autocd = true;
      dotDir = ".config/zsh";
      oh-my-zsh = {
        enable = true;
        theme = "simple";
      };
      plugins = [
        {
          name = "vi-mode";
          src = pkgs.zsh-vi-mode;
          file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
        }
      ];
      initExtraBeforeCompInit = ''
        export ZSH_COMPDUMP=$ZSH/cache/.zcompdump
      '';
      initExtra =
        /*
        bash
        */
        ''
          mkcdir = () {
            mkdir -p -- "$1" &&
            cd -P -- "$1"
          }
          ex = () {
            if [ -f $1 ] ; then
              case $1 in
                *.tar.bz2) tar xjf $1 ;;
                *.tar.gz)  tar xzf $1 ;;
                *.bz2)     bunzip2 $1 ;;
                *.rar)     ${pkgs.unrar-wrapper}/bin/unrar x $1 ;;
                *.gz)      gunzip $1 ;;
                *.tar)     tar xf $1 ;;
                *.tbz2)    tar xjf $1 ;;
                *.tgz)     tar xzf $1 ;;
                *.zip)     ${pkgs.unzip}/bin/unzip $1 ;;
                *.Z)       uncompress $1 ;;
                *.7z)      ${pkgs.p7zip}/bin/7z x $1 ;;
                *.deb)     ar x $1 ;;
                *.tar.xz)  tar xf $1 ;;
                *.tar.zst) unzstd $1 ;;
                *)         echo "Could not extract $1"
              esac
            else
              echo "$1 is not a valid file"
            fi
          }
          run() {
            NIXPKGS_ALLOW_UNFREE=1 NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM=1 nix run nixpkgs#$1 --impure -- ''${@:2}
          }
          Run() {
            NIXPKGS_ALLOW_UNFREE=1 NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM=1 nix shell nixpkgs#$1 --impure -c ''${@:2}
          }
        '';
    };
  };
}
