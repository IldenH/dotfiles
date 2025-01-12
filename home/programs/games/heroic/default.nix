{
  config,
  lib,
  pkgs,
  global,
  secrets,
  ...
}: {
  config = lib.mkIf config.settings.games.enable {
    home.packages = [pkgs.heroic];

    home.file.".config/heroic/themes/theme.css".text = import ./theme.nix {inherit config;};

    # https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/blob/main/src/frontend/screens/Settings/components/index.ts
    home.file.".config/heroic/store/config.json.home" = let
      home = config.home.homeDirectory;
    in {
      text = builtins.toJSON {
        userHome = home;
        language = "en";
        settings = {
          language = "en";
          hideChangelogsOnStartup = true;
          maxWorkers = 0;
          minimizeOnLaunch = false;
          nvidiaPrime = false;

          checkUpdatesInterval = 10;
          enableUpdates = false;
          checkForUpdatesOnStartup = false;
          autoUpdateGames = false;

          addDesktopShortcuts = false;
          addStartMenuShortcuts = false;
          addSteamShortcuts = false;

          autoInstallDxvk = true;
          autoInstallVkd3d = true;
          autoInstallDxvkNvapi = false;
          preferSystemLibs = false;

          libraryTopSection = "disabled";
          defaultSteamPath = "${home}/.steam/steam";
          defaultWinePrefix = "${home}/Games/Heroic/Prefixes/default";
          customWinePaths = [];
          defaultInstallPath = "${home}/Games/Heroic";
          customThemesPath = "${home}/.config/heroic/themes";

          wineCrossoverBottle = "Heroic";
          winePrefix = "${home}/Games/Heroic/Prefixes/default";
          wineVersion = {
            bin = "${home}/.config/heroic/tools/wine/Wine-GE-Proton8-26/bin/wine";
            name = "Wine - Wine-GE-Proton8-26";
            type = "wine";
            lib = "${home}/.config/heroic/tools/wine/Wine-GE-Proton8-26/lib64";
            lib32 = "${home}/.config/heroic/tools/wine/Wine-GE-Proton8-26/lib";
            wineserver = "${home}/.config/heroic/tools/wine/Wine-GE-Proton8-26/bin/wineserver";
          };

          enviromentOptions = [];
          wrapperOptions = [];
          showFps = false;
          useGameMode = false;
          enableEsync = true;
          enableFsync = true;
          enableMsync = false;
          eacRuntime = true;
          battlEyeRuntime = true;
          framelessWindow = false;
          beforeLaunchScriptPath = "";
          afterLaunchScriptPath = "";
        };
        userInfo = {
          account_id = secrets.heroic;
          displayName = global.user.description;
          user = global.user.name;
        };
        theme = "theme.css";
        contentFontFamily = "\"JetBrainsMono Nerd Font Mono\"";
        titlesAlwaysVisible = true;
        allTilesInColor = true;
      };
      onChange = ''
        rm -f $HOME/.config/heroic/store/config.json
        cp $HOME/.config/heroic/store/config.json.home $HOME/.config/heroic/store/config.json
        chmod u+w $HOME/.config/heroic/store/config.json
      '';
    };
  };
}
