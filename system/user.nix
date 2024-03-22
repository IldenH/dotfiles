{ pkgs, global, ... }:

{
  # Don't forget to set a password with ‘passwd’.
  users.users.${global.username} = {
    isNormalUser = true;
    description = "IldenH";
		initialPassword = "";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ ];
		shell = pkgs.zsh;
  };
}
