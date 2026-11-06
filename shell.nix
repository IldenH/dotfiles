{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  packages = with pkgs; [
    nixd
    alejandra
    statix
    lua-language-server
    stylua
  ];
}
