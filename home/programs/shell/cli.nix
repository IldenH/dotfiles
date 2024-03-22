{ lib, config, pkgs, ... }:

{
	options.terminal.cli.enable = lib.mkOption {
		type = lib.types.bool;
		default = false;
	};

	config = lib.mkIf (config.terminal.cli.enable) {
		home.packages = with pkgs; [
			bat-extras.batgrep
			tldr
		];

		programs.git = {
			enable = true;
			userName = "IldenH";
			userEmail = "IldenH.1" + "@" + "proton.me";
			extraConfig = {
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
			defaultOptions = [ "--color 16" ];
		};

		programs = {
			ripgrep.enable = true;
			thefuck.enable = true;
			zoxide.enable = true;
		};
	};
}
