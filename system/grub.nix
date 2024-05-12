{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.darkmatter.nixosModule
  ];

  boot.loader = {
    efi.canTouchEfiVariables = true;
    timeout = 2;
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
      darkmatter-theme = {
        enable = true;
        style = "nixos";
        icon = "color";
      };
    };
  };
}
