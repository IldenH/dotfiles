{
  # first run
  "app.normandy.first_run" = false;
  "doh-rollout.doneFirstRun" = true;
  "toolkit.telemetry.reportingpolicy.firstRun" = false;

  # privacy
  "dom.security.https_only_mode" = true;
  "identity.fxaccounts.enabled" = false;
  "signon.rememberSignons" = false;

  "privacy.trackingprotection.enabled" = true;
  "privacy.donottrackheader.enabled" = true;
  "privacy.fingerprintingProtection.enabled" = true;
  "privacy.globalprivacycontrol.enabled" = true;

  # newtabpage
  "browser.startup.homepage" = "";
  "browser.startup.page" = 3; # Restore pages on startup
  "browser.newtabpage.activity-stream.showSearch" = false;
  "browser.newtabpage.activity-stream.feeds.topsites" = false;

  # no thanks mozilla
  "app.shield.optoutstudies.enabled" = false;
  "toolkit.telemetry.pioneer-new-studies-available" = false;
  "browser.contentblocking.report.show_mobile_app" = false;
  "extensions.pocket.enabled" = false;
  "datareporting.policy.firstRunURL" = ""; # skips "at mozilla we believe..."
  "datareporting.healthreport.uploadEnabled" = false;
  "datareporting.policy.dataSubmissionEnabled" = false; # https://bugzilla.mozilla.org/show_bug.cgi?id=1195552#c4

  # i don't know what is but probably good
  "browser.shell.checkDefaultBrowser" = false;
  "browser.shell.defaultBrowserCheckCount" = 1;
  "browser.startup.homepage_override.mstone" = "ignore";

  # urlbar
  "browser.urlbar.shortcuts.bookmarks" = false;
  "browser.urlbar.shortcuts.history" = false;
  "browser.urlbar.shortcuts.tabs" = false;
  "browser.urlbar.suggest.engines" = false;
  "browser.urlbar.suggest.openpage" = false;
  "browser.urlbar.suggest.topsites" = false;

  # translations
  "browser.translations.panelShown" = false;
  "browser.translations.enable" = false;
  "browser.translations.automaticallyPopup" = false;

  # nice stuff
  "general.autoScroll" = true;
  "browser.aboutConfig.showWarning" = false;
  "browser.disableResetPrompt" = true;
  "extensions.autoDisableScopes" = 0; # enables all extensions
  "media.videocontrols.picture-in-picture.enabled" = false;
  "toolkit.legacyUserProfileCustomizations.stylesheets" = true; # makes userchrome work
  "browser.download.panel.shown" = true;

  # drm and hardware accelaration
  "browser.eme.ui.enabled" = true;
  "media.eme.enabled" = true;

  "media.hardware-video-decoding.force-enabled" = true;
  "layers.acceleration.force-enabled" = true;

  # ui
  "browser.tabs.firefox-view" = false;
  "browser.tabs.tabmanager.enabled" = false;
  "browser.toolbars.bookmarks.visibility" = "newtab";
  "widget.gtk.overlay-scrollbars.enabled" = false;

  # needs to be a string like this
  "browser.uiCustomization.state" = ''{"placements":{"widget-overflow-fixed-list":[],"unified-extensions-area":["_6b733b82-9261-47ee-a595-2dda294a4d08_-browser-action","jid1-mnnxcxisbpnsxq_jetpack-browser-action","_74145f27-f039-47ce-a470-a662b129930a_-browser-action","_contain-facebook-browser-action","dfyoutube_example_com-browser-action","jid1-kkzogwgsw3ao4q_jetpack-browser-action","addon_simplelogin-browser-action","sponsorblocker_ajay_app-browser-action","_34daeb50-c2d2-4f14-886a-7160b24d66a4_-browser-action","_9a41dee2-b924-4161-a971-7fb35c053a4a_-browser-action"],"nav-bar":["back-button","forward-button","stop-reload-button","urlbar-container","downloads-button","addon_darkreader_org-browser-action","_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action","ublock0_raymondhill_net-browser-action","_7a7a4a92-a2a0-41d1-9fd7-1e92480d612d_-browser-action","unified-extensions-button"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["tabbrowser-tabs","new-tab-button","alltabs-button"],"PersonalToolbar":["personal-bookmarks"]},"seen":["save-to-pocket-button","developer-button","_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action","_74145f27-f039-47ce-a470-a662b129930a_-browser-action","addon_darkreader_org-browser-action","dfyoutube_example_com-browser-action","_9a41dee2-b924-4161-a971-7fb35c053a4a_-browser-action","_contain-facebook-browser-action","jid1-kkzogwgsw3ao4q_jetpack-browser-action","jid1-mnnxcxisbpnsxq_jetpack-browser-action","addon_simplelogin-browser-action","sponsorblocker_ajay_app-browser-action","_7a7a4a92-a2a0-41d1-9fd7-1e92480d612d_-browser-action","ublock0_raymondhill_net-browser-action","_34daeb50-c2d2-4f14-886a-7160b24d66a4_-browser-action","_6b733b82-9261-47ee-a595-2dda294a4d08_-browser-action"],"dirtyAreaCache":["nav-bar","PersonalToolbar","unified-extensions-area","TabsToolbar","toolbar-menubar"],"currentVersion":20,"newElementCount":6}'';
}
