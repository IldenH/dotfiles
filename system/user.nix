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
  };
}
