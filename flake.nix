{
  description = "NixOS config flake";

  inputs = {
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

    hypridle = {
      url = "github:hyprwm/hypridle";
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

    nix-cursors = {
      url = "github:LilleAila/nix-cursors";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim-config = {
      url = "github:IldenH/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    programsdb = {
      url = "github:wamserma/flake-programs-sqlite";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    # lib = nixpkgs.lib // home-manager.lib;
    lib = nixpkgs.lib.extend (final: prev: (import ./lib final) // home-manager.lib);

    global = {
      user = {
        name = "ildenhnix";
        description = "IldenH";
      };
    };

    secrets = import ./secrets;

    systems = [
      "x86_64-linux"
      "aarch64-linux"
    ];

    forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});
    pkgsFor = lib.genAttrs systems (
      system:
        import nixpkgs {
          inherit system;
        }
    );

    mkHost = hostName: extraModules:
      nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs global secrets lib hostName;};
        modules =
          [
            ./hosts/${hostName}/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                extraSpecialArgs = {
                  inherit inputs global secrets lib;
                  isNixos = true;
                };
                useUserPackages = true;
                useGlobalPkgs = true;
                backupFileExtension = "backup";
                users."${global.user.name}" = ./hosts/${hostName}/home.nix;
              };
            }
            (lib.mkAliasOptionModule ["hm"] ["home-manager" "users" global.user.name])
          ]
          ++ extraModules;
      };
  in {
    devShells = forEachSystem (pkgs: {default = import ./shell.nix {inherit pkgs;};});

    nixosConfigurations = {
      desktop = mkHost "desktop" [];
      t420s = mkHost "t420s" [];
      e14 = mkHost "e14" []; # TODO: nixos-hardware
    };
  };
}
