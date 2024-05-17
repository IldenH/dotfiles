{
  inputs,
  config,
  global,
  lib,
  ...
}: {
  imports = [
    inputs.sops-nix.nixosModules.default
  ];

  options.settings.sops.enable = lib.mkEnableOption "sops";

  config = lib.mkIf (config.settings.sops.enable) {
    sops.defaultSopsFile = ../secrets/secrets.yaml;
    sops.defaultSopsFormat = "yaml";
    sops.age.keyFile = "/home/${global.user.name}/.config/sops/age/keys.txt";

    # still need to set password with `passwd` for sudo and hyprlock to work, I don't know why
    # generate hashed password: `echo "password" | mkpasswd -s`. Remember to delete from history!
    sops.secrets.password.neededForUsers = true;
    users.users."${global.user.name}".hashedPasswordFile = config.sops.secrets.password.path;

    # allow authentication hyprlock, doesn't work I don't know why
    # security.pam.services.hyprlock = {};
  };
}
