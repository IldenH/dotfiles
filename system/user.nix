{
  secrets,
  global,
  ...
}: {
  users.mutableUsers = false;
  users.users.${global.user.name} = {
    isNormalUser = true;
    description = global.user.description;
    password = secrets.password;
    extraGroups = ["wheel"];
    uid = 1000;
  };

  nix.settings.trusted-users = [global.user.name];

  users.groups.users.gid = 100;
}
