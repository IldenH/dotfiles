{ config, pkgs, inputs, lib, ... }:

{
	imports = [
		./zathura.nix
	];
  home.packages = with pkgs; [
    python311Packages.pygments
    pandoc
    texliveFull
  ];
}
