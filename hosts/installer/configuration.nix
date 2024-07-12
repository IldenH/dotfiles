{
  lib,
  modulesPath,
  ...
}: {
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
    ../../system
  ];

  services.openssh.enable = true;

  boot.loader.grub.enable = lib.mkForce false;
  boot.loader.timeout = lib.mkForce 10;

  settings = {
    keyMap = "no";

    utils.enable = true;
  };

  nixpkgs.hostPlatform = "x86_64-linux";
}
