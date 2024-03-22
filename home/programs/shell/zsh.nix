{ lib, config, pkgs, ... }:

{
	options.terminal.zsh = {
		enable = lib.mkOption {
			type = lib.types.bool;
			default = false;
		};
		theme = lib.mkOption {
			type = lib.types.str;
			default = "simple";
		};
	};
	config = lib.mkIf (config.terminal.zsh.enable) {
		programs.zsh = {
  	  enable = true;
  	  enableCompletion = true;
  	  # enableAutosuggestions = true;
  	  syntaxHighlighting.enable = true;
  	  oh-my-zsh = {
  	    enable = true;
  	    theme = config.terminal.zsh.theme;
  	  };
			shellAliases = {
				cat = "bat";
				rg = "batgrep";
				cd = "z";

				cls = "clear && neofetch && ls";

				makkergruppe = "nvim ~/Desktop/T1/makkergruppe-nr2";

				# cd aliases
				conf = "cd ~/.config";
				desk = "cd ~/Desktop";
				docs = "cd ~/Documents";
				downs = "cd ~/Downloads";
				music = "cd ~/Music";
				pics = "cd ~/Pictures";
				vids = "cd ~/Videos";

				".." = "cd ..";
				"..." = "cd ../..";

				pymacros = "cd ~/Desktop/Macros/python-macros";
				bashsh = "cd ~/Desktop/Macros/bash-scripts";
				"digilær" = "cd ~/Desktop/T1/digilær-innleveringer";
				kladding = "cd ~/Desktop/T1/kladding";
				backup = "cd ~/Desktop/Macros/bash-scripts/backup";

				dot = "cd ~/dotfiles";
				hm = "cd ~/dotfiles/home/programs";
				hypr = "cd ~/dotfiles/home/programs/wm/hyprland";

				nixbuild = "sudo nixos-rebuild switch --flake ~/dotfiles/#desktop"; # TODO: make it figure out #...
			};
			initExtra = ''
				neofetch
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
			'';
		};
	};
}
