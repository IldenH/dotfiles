{
  config,
  pkgs,
  inputs,
  lib,
  global,
  ...
}: {
  options.settings.discord.enable = lib.mkEnableOption "discord";

  config = lib.mkIf (config.settings.discord.enable) {
    home.packages = with pkgs; [
      vesktop
    ];

    home.file.".config/vesktop/settings.json".text = ''
      {
      	"discordBranch": "stable",
      	"minimizeToTray": false,
      	"arRPC": false,
      	"disableMinSize": true,
      	"staticTitle": true,
      	"splashTheming": true,
      	"checkUpdates": false,
       		"tray": false,
       		"hardwareAcceleration": false
      }
    '';

    home.file.".config/vesktop/settings/settings.json".source = ./settings.json;

    home.file.".config/vesktop/themes/base16.theme.css".text = import ./theme.nix {inherit config global;};
  };
}
