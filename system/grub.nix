{ ... }:

{
	boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 2;

  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
    useOSProber = true;
  };
}
