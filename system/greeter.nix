{
  config,
  pkgs,
  lib,
  global,
  ...
}: {
  config = lib.mkIf config.hm.settings.hyprland.enable {
    boot.kernelParams = ["console=tty1"];
    environment.systemPackages = [pkgs.greetd.tuigreet];
    services.greetd = {
      enable = true;
      vt = 2;
      settings.default_session.command = ''
        ${lib.getExe pkgs.greetd.tuigreet} --cmd Hyprland \
          --time \
          --time-format '%A %d. %B %Y, Uke %V, %H:%M' \
          --user-menu \
          --asterisks \
          --container-padding 2 \
          --window-padding 2 \
          --remember \
          --theme 'text=magenta;time=red;container=darkgray;border=magenta;prompt=blue;input=cyan;action=blue'
      '';
    };
    systemd.tmpfiles.rules = [
      "f /var/cache/tuigreet/lastuser 0755 greeter greeter -"
      "w /var/cache/tuigreet/lastuser - - - - ${global.user.name}"

      "f /var/cache/tuigreet/lastuser-name 0755 greeter greeter -"
      "w /var/cache/tuigreet/lastuser-name - - - - ${global.user.description}"
    ];
  };
}
