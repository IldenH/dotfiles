{config, ...}: {
  services.mako.settings = with config.colorScheme.palette; {
    background-color = "#${base01}";
    border-color = "#${base0E}";
    border-radius = 5;
    border-size = 1;
    text-color = "#${base04}";
    layer = "overlay";
    default-timeout = 2500;
  };
}
