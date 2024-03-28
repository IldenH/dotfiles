{ lib, pkgs, config, ... }:

{
	imports = [
	  ./grub.nix
		./hyprland.nix
		./japanese.nix
		./locale.nix
		./networking.nix
		./nvidia.nix
		./sddm
		./steam.nix
		./user.nix
	];

	options.settings = {
		utils.enable = lib.mkEnableOption "utils";
		optimization.enable = lib.mkEnableOption "optimization";
		sound.enable = lib.mkEnableOption "sound";
		shell = lib.mkOption {
			type = lib.types.package;
			default = pkgs.zsh;
		};
	};

	config = lib.mkMerge [
		(lib.mkIf (config.settings.utils.enable) {
			nix.settings.experimental-features = [ "nix-command" "flakes" ];
			nixpkgs.config.allowUnfree = true;

			services = {
				printing.enable = true;
			};

			programs = {
				zsh.enable = true;
				dconf.enable = true;
			};

  		environment.shells = [ config.settings.shell ];

			environment.systemPackages = with pkgs; [
				curl
				git
				home-manager
				neovim
				wget
			];
		})
		(lib.mkIf (config.settings.sound.enable) {
			sound.enable = true;
			hardware.pulseaudio.enable = false;
			security.rtkit.enable = true;
			services.pipewire = {
				enable = true;
				alsa.enable = true;
				alsa.support32Bit = true;
				pulse.enable = true;
				# jack.enable = true;
				# media-session.enable = true;
			};
		})
		(lib.mkIf (config.settings.optimization.enable) {
		  nix = {
		    gc = {
		      automatic = true;
		      options = "--delete-older-than 30d";
		    };
		    settings.auto-optimise-store = true;
		    optimise.automatic = true;
		  };
			services.fstrim.enable = true;
		})
	];
}
