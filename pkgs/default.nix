# https://unix.stackexchange.com/questions/717168/how-to-package-my-software-in-nix-or-write-my-own-package-derivation-for-nixpkgs
{
  pkgs ? import <nixpkgs> {},
  inputs,
  ...
}: let
  colorScheme = inputs.nix-colors.colorScheme.gruvbox-medium-dark;
in {
  grub-theme = pkgs.callPackage ./grub-theme.nix {inherit colorScheme;};
}
