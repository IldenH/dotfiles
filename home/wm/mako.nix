{config, ...}: {
  services.mako = with config.colorScheme.palette; {
    backgroundColor = "#${base01}";
    borderColor = "#${base0E}";
    borderRadius = 5;
    borderSize = 1;
    textColor = "#${base04}";
    layer = "overlay";
    defaultTimeout = 2500;
  };
}
