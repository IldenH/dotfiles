{ pkgs, ... }:

{
  # Don't forget to set a password with ‘passwd’.
  users.users.ildenhnix = {
    isNormalUser = true;
    description = "IldenH";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ ];
		shell = pkgs.zsh;
  };
}
