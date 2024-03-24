{ pkgs, global, ... }:

{
  # Don't forget to set a password with ‘passwd’.
  users.users.${global.user.name} = {
    isNormalUser = true;
    description = "${global.user.description}";
		initialPassword = "";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ ];
		shell = pkgs.zsh;
  };
}
