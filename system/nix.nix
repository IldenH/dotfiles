{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkIf config.settings.utils.enable {
    nixpkgs.config.allowUnfree = true;

    programs.command-not-found.dbPath = inputs.programsdb.packages.${pkgs.system}.programs-sqlite;

    nix = {
      settings = {
        experimental-features = ["nix-command" "flakes"];

        warn-dirty = false;
        eval-cache = false;
        keep-going = true;

        use-xdg-base-directories = true;
      };

      registry.nixpkgs.flake = inputs.nixpkgs;
      nixPath = [
        "nixpkgs=/etc/nixpkgs/channels/nixpkgs"
        "/nix/var/nix/profiles/per-user/root/channels"
      ];
    };

    systemd.tmpfiles.rules = [
      "L+ /etc/nixpkgs/channels/nixpkgs - - - - ${pkgs.path}"
    ];
  };
}
