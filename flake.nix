{
  description = "NixOS config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    secrets = {
      url = "git+ssh://git@github.com/IldenH/dotfiles-secrets.git";
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
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    lib = nixpkgs.lib // home-manager.lib;

    global = {
      user = {
        name = "ildenhnix";
        description = "IldenH";
      };
    };

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

    mkHost = {
      name,
      extraModules ? [],
    }:
      nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs global;};
        modules =
          [
            ./hosts/${name}/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                extraSpecialArgs = {
                  inherit inputs global;
                  isNixos = true;
                };
                useUserPackages = true;
                useGlobalPkgs = true;
                users."${global.user.name}" = ./home/hosts/${name}.nix;
              };
            }
            (lib.mkAliasOptionModule ["hm"] ["home-manager" "users" global.user.name])
          ]
          ++ extraModules;
      };
  in {
    devShells = forEachSystem (pkgs: {default = import ./shell.nix {inherit pkgs;};});

    nixosConfigurations = {
      desktop = mkHost {
        name = "desktop";
      };
      laptop = mkHost {
        name = "laptop";
      };
    };
  };
}
