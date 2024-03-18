{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
		nix-colors.url = "github:misterio77/nix-colors";

		### HYPRLAND ###
		hyprland.url = "github:hyprwm/Hyprland";
		hyprpaper = {
			url = "github:hyprwm/hyprpaper";
			inputs.nixpkgs.follows = "nixpkgs";
		};
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
				desktop = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [ 
            ./hosts/desktop/configuration.nix
						home-manager.nixosModules.home-manager {
							home-manager = {
								extraSpecialArgs = { inherit inputs; };
								useUserPackages = true;
								useGlobalPkgs = true;
								users.ildenhnix = ./home/home.nix;
							};
						}
          ];
        };
			};
    };
}
