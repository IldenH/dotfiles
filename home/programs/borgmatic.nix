_: {
  # can't decide if I want to use this or just use a simple script
  programs.borgmatic.backups.test = {
    location = {
      excludeHomeManagerSymlinks = true;
      sourceDirectories = ["/home/ildenhnix/borgmatic-source"];
      repositories = ["/home/ildenhnix/borgmatic-destination"];
    };
  };
}
