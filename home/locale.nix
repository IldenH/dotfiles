{
  config,
  lib,
  ...
}: {
  options.settings.locale = {
    main = lib.mkStrOption "en_US.UTF-8";
    extra = lib.mkStrOption config.settings.locale.main;
    timeZone = lib.mkStrOption "Europe/Oslo";
  };

  config.home.language = with config.settings.locale; {
    base = main;
    messages = main;

    address = extra;
    collate = extra;
    ctype = extra;
    measurement = extra;
    monetary = extra;
    name = extra;
    numeric = extra;
    paper = extra;
    telephone = extra;
    time = extra;
  };
}
