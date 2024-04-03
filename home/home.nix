{ config, inputs, lib, ... }:

{
  imports = [ ./. ];

	colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-medium;

	settings = {
		wallpaper = ./wallpaper.jpg;
    monitors = [
			{
				name = "HDMI-A-2";
				width = 1920;
				height = 1080;
				refreshRate = 60;
				x = 0;
				y = 0;
				enable = true;
			}
      {
        name = "DP-2";
        width = 1920;
        height = 1080;
        refreshRate = 60;
        x = 1920;
        y = 0;
        enable = true;
      }
    ];
	
		zathura.enable = true;
		discord.enable = true;
		# browser.enable = true; # WIP
		files.enable = true;
		nightlight.enable = false; # doesn't work with Nvida 535, using monitor's builtin nightlight
		qt-gtk-themes.enable = true;
		steam.enable = true;
		# espanso.enable = true; # service doesn't run properly

		screenshots = {
			enable = true;
			format = "%Y-%m-%d_%H-%M-%S.png";
			path = {
				raw = "$HOME/Pictures/Screenshots/Raw";
				edited = "$HOME/Pictures/Screenshots/Edited";
			};
		};
	
		terminal = {
			enable = true;
			neovim.enable = true;
			cli.enable = true;
			zsh = {
				enable = true;
				theme = "simple";
			};
		};

		waybar.enable = true;

		hyprland = {
			enable = true;
		};
	};

	home.shellAliases = {
		# TODO: remove --impure when xz fixed
		nixbuild = "sudo nixos-rebuild switch --flake ~/dotfiles/#desktop --impure";
	};
}
