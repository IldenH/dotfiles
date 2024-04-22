{
  description = "NixOS config flake";

  inputs = {
		### CORE ###
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

		home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

		### HYPRLAND ###
		hyprland = {
			url = "github:hyprwm/Hyprland";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		hyprlock = {
			url = "github:hyprwm/hyprlock";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		hyprpaper = {
			url = "github:hyprwm/hyprpaper";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		### OTHER ###
		nix-colors.url = "github:misterio77/nix-colors";

    darkmatter = {
      url = "gitlab:VandalByte/darkmatter-grub-theme";
      inputs.nixpkgs.follows = "nixpkgs";
    };

		firefox-addons = {
			url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
			inputs.nixpkgs.follows = "nixpkgs";
		};

    nh = {
      url = "github:viperML/nh";
      inputs.nixpkgs.follows = "nixpkgs";
    };

		nix-cursors = {
			url = "github:LilleAila/nix-cursors";
			inputs.nixpkgs.follows = "nixpkgs";
		};
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
			global = {
				user = {
					name = "ildenhnix";
					description = "IldenH";
				};
			};
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
				desktop = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs global; };
          modules = [ 
            ./hosts/desktop/configuration.nix
						home-manager.nixosModules.home-manager {
							home-manager = {
								extraSpecialArgs = { inherit inputs global; };
								useUserPackages = true;
								useGlobalPkgs = true;
								users."${global.user.name}" = ./home/hosts/desktop.nix;
							};
						}
          ];
        };
				laptop = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs global; };
          modules = [ 
            ./hosts/laptop/configuration.nix
						home-manager.nixosModules.home-manager {
							home-manager = {
								extraSpecialArgs = { inherit inputs global; };
								useUserPackages = true;
								useGlobalPkgs = true;
								users."${global.user.name}" = ./home/hosts/laptop.nix;
							};
						}
          ];
        };
			};
    };
}
