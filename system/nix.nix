{ ... }:

{
	nixpkgs.config.allowUnfree = true;
  nix = {
    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
    };
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
    optimise.automatic = true;
  };
}
