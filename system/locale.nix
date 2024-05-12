{
  config,
  lib,
  ...
}: {
  options.settings.locale = {
    main = lib.mkOption {
      type = lib.types.str;
      default = "en_US.UTF-8";
    };
    extra = lib.mkOption {
      type = lib.types.str;
      default = config.settings.locale.main;
    };
    timeZone = lib.mkOption {
      type = lib.types.str;
      default = "Europe/Oslo";
    };
    keyMap = lib.mkOption {
      type = lib.types.str;
      default = "no";
    };
  };

  config = with config.settings.locale; {
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

    services.xserver.xkb = {
      layout = keyMap;
      variant = "";
    };
  };
}
