{ inputs, ... }:

{
	imports = [
		inputs.darkmatter.nixosModule
	];
	boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 2;

  boot.loader.grub = {
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
}
