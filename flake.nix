{
  description = "NixOS config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    nix-colors.url = "github:misterio77/nix-colors";

    impermanence.url = "github:nix-community/impermanence";

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

    nvf-config = {
      url = "github:IldenH/nvf-config";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nix-colors.follows = "nix-colors";
    };

    programsdb = {
      url = "github:wamserma/flake-programs-sqlite";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    wl-screenrec-daemon = {
      url = "github:LilleAila/wl-screenrec-daemon";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    focal = {
      url = "github:iynaix/focal";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    lib = nixpkgs.lib.extend (final: prev: (import ./lib final) // home-manager.lib);

    global = {
      user = {
        name = "ildenhnix";
        description = "IldenH";
      };
    };

    secrets = import ./secrets;

    systems = lib.systems.flakeExposed;
    pkgsFor = lib.genAttrs systems (
      system:
        import nixpkgs {
          inherit system;
        }
    );
    forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});

    mkHost = hostName: extraModules:
      lib.nixosSystem {
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
      e14 = mkHost "e14" [inputs.nixos-hardware.nixosModules.lenovo-thinkpad-e14-amd];
      installer = lib.nixosSystem {
        specialArgs = {inherit inputs global lib secrets;};
        modules = [./hosts/installer/configuration.nix];
      };
    };
  };
}
