{
  config,
  lib,
  ...
}: {
  programs.firefox = lib.mkIf (config.hm.settings.browser.enable) {
    enable = true;
    policies = {
      # Probably things here that can be put in home-manager

      NoDefaultBookmarks = true;
      PasswordManagerEnabled = false;
      OfferToSaveLogins = false;

      SanitizeOnShutdown = {
        Locked = true;
        Cache = true;
        Cookies = false;
        Downloads = true;
        FormData = true;
        History = false;
        Sessions = false;
        SiteSettings = false;
        # OfflineApps = true; # I don't know what this is
      };

      SearchEngines = {
        PreventInstalls = true;
        Remove = [
          "Amazon.com"
          "Bing"
          "Google"
          "Wikipedia"
          "DuckDuckGo"
        ];
      };

      UserMessaging = {
        Locked = true;
        ExtensionRecommendations = false;
        FeatureRecommendations = false;
        MoreFromMozilla = false; # section in preferences
        SkipOnboarding = true; # onboarding messages on new tab page
        UrlbarInterventions = false; # urlbar suggestions
        WhatsNew = false;
      };

      # TODO: figure out other extensions' settings
      "3rdparty".Extensions = {
        # https://github.com/gorhill/uBlock/blob/master/platform/common/managed_storage.json
        "uBlock0@raymondhill.net".adminSettings = {
          userSettings = {
            contextMenuEnabled = false;
            popupPanelSections = 15;
            showIconBadge = false;
          };
          selectedFilterLists = [
            "user-filters"
            "ublock-filters"
            "ublock-badware"
            "ublock-privacy"
            "ublock-quick-fixes"
            "ublock-unbreak"
            "easylist"
            "adguard-generic"
            "adguard-mobile"
            "easyprivacy"
            "adguard-spyware"
            "adguard-spyware-url"
            "block-lan"
            "urlhaus-1"
            "curben-phishing"
            "plowe-0"
            "dpollock-0"
            "fanboy-cookiemonster"
            "ublock-cookies-easylist"
            "adguard-cookies"
            "ublock-cookies-adguard"
            "fanboy-social"
            "adguard-social"
            "fanboy-thirdparty_social"
            "easylist-chat"
            "easylist-newsletters"
            "easylist-notifications"
            "easylist-annoyances"
            "adguard-mobile-app-banners"
            "adguard-other-annoyances"
            "adguard-popup-overlays"
            "adguard-widgets"
            "ublock-annoyances"
            "NOR-0"
          ];
          userFilters = ''
            www.youtube.com###scroll-container > .ytd-feed-filter-chip-bar-renderer.style-scope
            www.youtube.com###right-arrow-button > .ytd-feed-filter-chip-bar-renderer.style-scope > yt-button-shape > .yt-spec-button-shape-next--icon-only-default.yt-spec-button-shape-next--size-m.yt-spec-button-shape-next--mono.yt-spec-button-shape-next--text.yt-spec-button-shape-next > yt-touch-feedback-shape > .yt-spec-touch-feedback-shape--touch-response.yt-spec-touch-feedback-shape > .yt-spec-touch-feedback-shape__fill
            www.youtube.com###header > .ytd-rich-grid-renderer.style-scope
            www.youtube.com###rich-shelf-header
            www.youtube.com###dismissible > .ytd-rich-shelf-renderer.style-scope
            www.youtube.com###content > .ytd-rich-section-renderer.style-scope
            www.youtube.com###flexible-item-buttons > ytd-button-renderer.ytd-menu-renderer.style-scope:nth-of-type(1) > yt-button-shape > .yt-spec-button-shape-next--icon-leading.yt-spec-button-shape-next--size-m.yt-spec-button-shape-next--mono.yt-spec-button-shape-next--tonal.yt-spec-button-shape-next > yt-touch-feedback-shape > .yt-spec-touch-feedback-shape--touch-response.yt-spec-touch-feedback-shape > .yt-spec-touch-feedback-shape__fill
            www.youtube.com###flexible-item-buttons > ytd-button-renderer.ytd-menu-renderer.style-scope:nth-of-type(1) > yt-button-shape > .yt-spec-button-shape-next--icon-leading.yt-spec-button-shape-next--size-m.yt-spec-button-shape-next--mono.yt-spec-button-shape-next--tonal.yt-spec-button-shape-next > yt-touch-feedback-shape > .yt-spec-touch-feedback-shape--touch-response.yt-spec-touch-feedback-shape > .yt-spec-touch-feedback-shape__stroke
            www.youtube.com###flexible-item-buttons > ytd-button-renderer.ytd-menu-renderer.style-scope:nth-of-type(1) > yt-button-shape > .yt-spec-button-shape-next--icon-leading.yt-spec-button-shape-next--size-m.yt-spec-button-shape-next--mono.yt-spec-button-shape-next--tonal.yt-spec-button-shape-next > yt-touch-feedback-shape > .yt-spec-touch-feedback-shape--touch-response.yt-spec-touch-feedback-shape
            www.youtube.com###flexible-item-buttons > ytd-button-renderer.ytd-menu-renderer.style-scope:nth-of-type(1) > yt-button-shape > .yt-spec-button-shape-next--icon-leading.yt-spec-button-shape-next--size-m.yt-spec-button-shape-next--mono.yt-spec-button-shape-next--tonal.yt-spec-button-shape-next > .yt-spec-button-shape-next__button-text-content.cbox > .yt-core-attributed-string--white-space-no-wrap.yt-core-attributed-string
            www.youtube.com###flexible-item-buttons > ytd-button-renderer.ytd-menu-renderer.style-scope:nth-of-type(1) > yt-button-shape > .yt-spec-button-shape-next--icon-leading.yt-spec-button-shape-next--size-m.yt-spec-button-shape-next--mono.yt-spec-button-shape-next--tonal.yt-spec-button-shape-next > .yt-spec-button-shape-next__icon > yt-icon > .yt-icon.style-scope > .yt-spec-icon-shape > div
            www.youtube.com###flexible-item-buttons > ytd-button-renderer.ytd-menu-renderer.style-scope:nth-of-type(1) > yt-button-shape > .yt-spec-button-shape-next--icon-leading.yt-spec-button-shape-next--size-m.yt-spec-button-shape-next--mono.yt-spec-button-shape-next--tonal.yt-spec-button-shape-next > .yt-spec-button-shape-next__icon > yt-icon > .yt-icon.style-scope > .yt-spec-icon-shape
            www.youtube.com###flexible-item-buttons > ytd-button-renderer.ytd-menu-renderer.style-scope:nth-of-type(1) > yt-button-shape > .yt-spec-button-shape-next--icon-leading.yt-spec-button-shape-next--size-m.yt-spec-button-shape-next--mono.yt-spec-button-shape-next--tonal.yt-spec-button-shape-next > .yt-spec-button-shape-next__icon > yt-icon > .yt-icon.style-scope
            www.youtube.com###flexible-item-buttons > ytd-button-renderer.ytd-menu-renderer.style-scope:nth-of-type(1) > yt-button-shape > .yt-spec-button-shape-next--icon-leading.yt-spec-button-shape-next--size-m.yt-spec-button-shape-next--mono.yt-spec-button-shape-next--tonal.yt-spec-button-shape-next
            www.youtube.com###flexible-item-buttons > ytd-button-renderer.ytd-menu-renderer.style-scope > yt-button-shape > .yt-spec-button-shape-next--icon-leading.yt-spec-button-shape-next--size-m.yt-spec-button-shape-next--mono.yt-spec-button-shape-next--tonal.yt-spec-button-shape-next > yt-touch-feedback-shape > .yt-spec-touch-feedback-shape--touch-response.yt-spec-touch-feedback-shape > .yt-spec-touch-feedback-shape__fill
            www.youtube.com##ytd-button-renderer.ytd-menu-renderer.style-scope:nth-of-type(2) > yt-button-shape > .yt-spec-button-shape-next--icon-leading.yt-spec-button-shape-next--size-m.yt-spec-button-shape-next--mono.yt-spec-button-shape-next--tonal.yt-spec-button-shape-next > yt-touch-feedback-shape > .yt-spec-touch-feedback-shape--touch-response.yt-spec-touch-feedback-shape > .yt-spec-touch-feedback-shape__stroke
            www.youtube.com###flexible-item-buttons > ytd-button-renderer.ytd-menu-renderer.style-scope > yt-button-shape > .yt-spec-button-shape-next--icon-leading.yt-spec-button-shape-next--size-m.yt-spec-button-shape-next--mono.yt-spec-button-shape-next--tonal.yt-spec-button-shape-next > yt-touch-feedback-shape > .yt-spec-touch-feedback-shape--touch-response.yt-spec-touch-feedback-shape
            www.youtube.com##ytd-button-renderer.ytd-menu-renderer.style-scope:nth-of-type(2) > yt-button-shape > .yt-spec-button-shape-next--icon-leading.yt-spec-button-shape-next--size-m.yt-spec-button-shape-next--mono.yt-spec-button-shape-next--tonal.yt-spec-button-shape-next > .yt-spec-button-shape-next__button-text-content.cbox > .yt-core-attributed-string--white-space-no-wrap.yt-core-attributed-string
            www.youtube.com##ytd-button-renderer.ytd-menu-renderer.style-scope:nth-of-type(2) > yt-button-shape > .yt-spec-button-shape-next--icon-leading.yt-spec-button-shape-next--size-m.yt-spec-button-shape-next--mono.yt-spec-button-shape-next--tonal.yt-spec-button-shape-next > .yt-spec-button-shape-next__icon > yt-icon > .yt-icon.style-scope > .yt-spec-icon-shape > div
            www.youtube.com##ytd-button-renderer.ytd-menu-renderer.style-scope:nth-of-type(2) > yt-button-shape > .yt-spec-button-shape-next--icon-leading.yt-spec-button-shape-next--size-m.yt-spec-button-shape-next--mono.yt-spec-button-shape-next--tonal.yt-spec-button-shape-next > .yt-spec-button-shape-next__icon > yt-icon > .yt-icon.style-scope > .yt-spec-icon-shape
            www.youtube.com##ytd-button-renderer.ytd-menu-renderer.style-scope:nth-of-type(2) > yt-button-shape > .yt-spec-button-shape-next--icon-leading.yt-spec-button-shape-next--size-m.yt-spec-button-shape-next--mono.yt-spec-button-shape-next--tonal.yt-spec-button-shape-next > .yt-spec-button-shape-next__icon > yt-icon > .yt-icon.style-scope
            www.youtube.com##ytd-button-renderer.ytd-menu-renderer.style-scope:nth-of-type(2) > yt-button-shape > .yt-spec-button-shape-next--icon-leading.yt-spec-button-shape-next--size-m.yt-spec-button-shape-next--mono.yt-spec-button-shape-next--tonal.yt-spec-button-shape-next
            www.youtube.com###flexible-item-buttons
            www.youtube.com##.opened
            www.youtube.com##tp-yt-paper-dialog.ytd-popup-container.style-scope:nth-of-type(1)
            www.youtube.com##tp-yt-paper-dialog.ytd-popup-container.style-scope:nth-of-type(2)
            www.youtube.com###voice-search-button
            www.youtube.com##.ytp-show-tiles.videowall-endscreen.ytp-player-content.html5-endscreen
            www.youtube.com##+js(nano-stb, resovle(1), 5000, 0.001)
            www.youtube.com##ytd-guide-entry-renderer.ytd-guide-section-renderer.style-scope:nth-of-type(2)
            www.youtube.com##ytd-guide-section-renderer.ytd-guide-renderer.style-scope:nth-of-type(2)
            www.youtube.com##ytd-guide-section-renderer.ytd-guide-renderer.style-scope:nth-of-type(3)
            www.youtube.com##ytd-guide-section-renderer.ytd-guide-renderer.style-scope:nth-of-type(4)
            www.youtube.com##yt-related-chip-cloud-renderer.ytd-watch-next-secondary-results-renderer.style-scope

            www.facebook.com##.x88anuq.x1na7pl.x1p8ty84.xl56j7k.x1iyjqo2.x78zum5.xuk3077
            www.facebook.com##.x1xmf6yo.xev17xk.x9jhf4c.x30kzoy.xgqcy7u.x1lq5wgf.x4xrfw5.xua58t2.xycxndf.xzg4506
            www.facebook.com##div.xusnbm3.x1w6jkce.x1xmf6yo.xw3qccf.xsgj6o6 > .xh8yej3.x1n2onr6.xl56j7k.xdt5ytf.x3nfvp2.x9f619.x1a2a7pz.x1lku1pv.x87ps6o.x13rtm0m.x1e5q0jg.x3x9cwd.x1o1ewxj.xggy1nq.x1hl2dhg.x16tdsg8.xkhd6sd.x18d9i69.x4uap5.xexx8yu.x1mh8g0r.xat24cr.x11i5rnm.xdj266r.xe8uvvx.x1ypdohk.xav7gou.xaqea5y.x1b1mbwd.x6umtig.xjbqb8w.x1i10hfl > .x1swvt13.x1pi30zi.x1r1pt67.x1qhmfi1.x9f619.xm0m39n.x1qhh985.xcfux6l.x972fbf.x1403ito.x585lrc.x17zwfj4.xi112ho.x1q0g3np.xozqiw3.x6s0dn4.xl56j7k.x2lah0s.x78zum5.x1ja2u2z.x1n2onr6
            www.facebook.com##.xquyuld.x10wlt62.x6ikm8r.xh8yej3.xt3gfkd.xu5ydu1.xdney7k.x1qpq9i9.x2bj2ny.x1ja2u2z.x1n2onr6.x9f619 > .x10wlt62.x6ikm8r .x1ja2u2z.x1n2onr6.x9f619 > .x1y1aw1k.xwib8y2.x9otpla.x1wsgfga.x1ja2u2z.x1n2onr6.x9f619
            www.facebook.com##.xquyuld.x10wlt62.x6ikm8r.xh8yej3.xt3gfkd.xu5ydu1.xdney7k.x1qpq9i9.x2bj2ny.x1ja2u2z.x1n2onr6.x9f619 > div > .xh8yej3.x1n2onr6.x78zum5
          '';
        };
      };
    };
  };
}
