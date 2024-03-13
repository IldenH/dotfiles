{ config, pkgs, inputs, lib, ... }:

{
  home.packages = with pkgs; [
    python311Packages.pygments
    pandoc
    texliveFull
    zathura
  ];
}
