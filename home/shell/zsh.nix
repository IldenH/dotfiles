{
  lib,
  config,
  pkgs,
  ...
}: {
  options.settings.terminal.zsh = {
    enable = lib.mkEnableOption "zsh";
    theme = lib.mkStrOption "simple";
  };
  config = lib.mkIf (config.settings.terminal.zsh.enable) {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      # enableAutosuggestions = true;
      syntaxHighlighting.enable = true;
      oh-my-zsh = {
        enable = true;
        theme = config.settings.terminal.zsh.theme;
      };
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
        '';
    };
  };
}
