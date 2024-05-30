{
  config,
  util,
  ...
}: {
  options.settings.keyMap = util.mkStrOption "no";

  config = with config.hm.settings.locale; {
    time.timeZone = timeZone;

    i18n.defaultLocale = main;

    i18n.extraLocaleSettings = {
      LC_ADDRESS = extra;
      LC_IDENTIFICATION = extra;
      LC_MEASUREMENT = extra;
      LC_MONETARY = extra;
      LC_NAME = extra;
      LC_NUMERIC = extra;
      LC_PAPER = extra;
      LC_TELEPHONE = extra;
      LC_TIME = extra;
    };

    services.xserver.xkb.layout = config.settings.keyMap;
  };
}
