{
  config,
  lib,
  global,
  ...
}: {
  options.settings.discord.enable = lib.mkEnableOption "discord";

  config = lib.mkIf config.settings.discord.enable {
    home.file.".config/vesktop/themes/base16.theme.css".text = import ./theme.nix {inherit config global;};

    programs.vesktop = {
      enable = true;
      settings = {
        autoUpdate = false;
        autoUpdateNotification = false;
        useQuickCss = true;
        themeLinks = [];
        eagerPatches = false;
        enabledThemes = ["base16.theme.css"];
        enableReactDevtools = false;
        frameless = false;
        transparent = false;
        winCtrlQ = false;
        disableMinSize = true;
        winNativeTitleBar = false;

        discordBranch = "stable";
        minimizeToTray = false;
        arRPC = false;
        staticTitle = true;
        splashTheming = true;
        splashColor = "#${config.colorScheme.palette.base05}";
        splashBackground = "#${config.colorScheme.palette.base00}";
        checkUpdates = false;
        tray = false;
        hardwareAcceleration = false;

        plugins = {
          BadgeAPI.enabled = true;
          ChatInputButtonAPI.enabled = true;
          CommandsAPI.enabled = true;
          ContextMenuAPI.enabled = true;
          MessageAccessoriesAPI.enabled = true;
          MessageEventsAPI.enabled = true;
          NoticesAPI.enabled = true;
          NoTrack.enabled = true;
          Settings.enabled = true;
          SupportHelper.enabled = true;
          BetterFolders = {
            enabled = true;
            sidebar = false;
            sidebarAnim = false;
            closeAllFolders = true;
            closeAllHomeButton = true;
            closeOthers = true;
            forceOpen = false;
            keepIcons = false;
            showFolderIcon = 1;
          };
          BiggerStreamPreview.enabled = true;
          CallTimer.enabled = true;
          ClearURLs.enabled = true;
          CopyUserURLs.enabled = true;
          CrashHandler.enabled = true;
          FakeNitro.enabled = true;
          FixCodeblockGap.enabled = true;
          FixYoutubeEmbeds.enabled = true;
          MemberCount.enabled = true;
          MessageClickActions = {
            enabled = true;
            enableDeleteOnClick = true;
            enableDoubleClickToEdit = true;
            enableDoubleClickToReply = true;
            requireModifier = false;
          };
          MessageLinkEmbeds.enabled = true;
          MessageLogger = {
            enabled = true;
            ignoreSelf = true;
          };
          MoreCommands.enabled = true;
          MoreKaomoji.enabled = true;
          MuteNewGuild = {
            enabled = true;
            guild = true;
            everyone = false;
            role = false;
          };
          PlainFolderIcon.enabled = true;
          MutualGroupDMs.enabled = true;
          NoMosaic.enabled = true;
          NoPendingCount.enabled = true;
          NoProfileThemes.enabled = true;
          NoUnblockToJump.enabled = true;
          NSFWGateBypass.enabled = true;
          PermissionsViewer.enabled = true;
          SendTimestamps = {
            enabled = true;
            replaceMessageContents = true;
          };
          SpotifyCrack.enabled = true;
          TypingIndicator.enabled = true;
          TypingTweaks = {
            enabled = true;
            alternativeFormatting = true;
            showRoleColors = true;
            showAvatars = true;
          };
          WebContextMenus.enabled = true;
          WebKeybinds.enabled = true;
          "WebRichPresence (arRPC)".enabled = false;
          VencordToolbox.enabled = true;
          ConcatenatedComponentExtractor.enabled = true;
          DisableDeepLinks.enabled = true;
        };
        uiElements = {
          chatBarButtons = {};
          messagePopoverButtons = {};
        };
        notifications = {
          timeout = 5000;
          position = "bottom-right";
          useNative = "not-focused";
          logLimit = 50;
        };
      };
    };
  };
}
