{
  config,
  secrets,
  ...
}: {
  services.searx = {
    enable = config.programs.firefox.enable;
    settings = {
      general = {
        instance_name = "Searx";
        enable_metrics = false;
      };
      search = {
        safe_search = 2;
      };
      server = {
        default_locale = "en";
        secret_key = secrets.searx;
      };
      ui = {
        infinite_scroll = true;
        hotkeys = "vim";
      };
      # Lock arbitrary settings on the preferences page. To find the ID of the user
      # setting you want to lock, check the ID of the form on the page "preferences".
      # preferences.lock = {
      # };
    };
  };
}
