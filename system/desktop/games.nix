{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.hm.settings.games.enable {
    programs.gamemode.enable = true;
    programs.gamescope.enable = true;

    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      gamescopeSession.enable = true;
    };
  };
}
