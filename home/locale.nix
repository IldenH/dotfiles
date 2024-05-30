{
  config,
  util,
  ...
}: {
  options.settings.locale = {
    main = util.mkStrOption "en_US.UTF-8";
    extra = util.mkStrOption config.settings.locale.main;
    timeZone = util.mkStrOption "Europe/Oslo";
  };

  config.home.language = with config.settings.locale; {
    base = main;

    address = extra;
    collate = extra;
    ctype = extra;
    measurement = extra;
    messages = extra;
    monetary = extra;
    name = extra;
    numeric = extra;
    paper = extra;
    telephone = extra;
    time = extra;
  };
}
