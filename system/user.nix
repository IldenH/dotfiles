{
  secrets,
  global,
  config,
  ...
}: {
  users.mutableUsers = false;
  users.users.${global.user.name} = {
    isNormalUser = true;
    description = global.user.description;
    password = secrets.password;
    extraGroups = ["wheel"];
    shell = config.settings.shell;
  };
}
