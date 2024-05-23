{
  config,
  pkgs,
  lib,
  ...
}: {
  config = lib.mkMerge [
    (lib.mkIf (config.hm.settings.steam.enable) {
      programs.steam = {
        enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
        gamescopeSession.enable = true;
      };
    })
    (lib.mkIf (config.hm.settings.games.enable) {
      programs = {
        gamemode.enable = true;
        gamescope.enable = true;
      };
    })
  ];
}
