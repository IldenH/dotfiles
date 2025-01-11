{config, ...}: {
  programs.firefox = {
    enable = config.hm.programs.firefox.enable;
    policies = {
      # Probably things here that can be put in home-manager

      NoDefaultBookmarks = true;
      PasswordManagerEnabled = false;
      OfferToSaveLogins = false;
      SearchEngines.PreventInstalls = true;

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
            www.facebook.com##.x88anuq.x1na7pl.x1p8ty84.xl56j7k.x1iyjqo2.x78zum5.xuk3077
            www.facebook.com##.x1xmf6yo.xev17xk.x9jhf4c.x30kzoy.xgqcy7u.x1lq5wgf.x4xrfw5.xua58t2.xycxndf.xzg4506
            www.facebook.com##div.xusnbm3.x1w6jkce.x1xmf6yo.xw3qccf.xsgj6o6 > .xh8yej3.x1n2onr6.xl56j7k.xdt5ytf.x3nfvp2.x9f619.x1a2a7pz.x1lku1pv.x87ps6o.x13rtm0m.x1e5q0jg.x3x9cwd.x1o1ewxj.xggy1nq.x1hl2dhg.x16tdsg8.xkhd6sd.x18d9i69.x4uap5.xexx8yu.x1mh8g0r.xat24cr.x11i5rnm.xdj266r.xe8uvvx.x1ypdohk.xav7gou.xaqea5y.x1b1mbwd.x6umtig.xjbqb8w.x1i10hfl > .x1swvt13.x1pi30zi.x1r1pt67.x1qhmfi1.x9f619.xm0m39n.x1qhh985.xcfux6l.x972fbf.x1403ito.x585lrc.x17zwfj4.xi112ho.x1q0g3np.xozqiw3.x6s0dn4.xl56j7k.x2lah0s.x78zum5.x1ja2u2z.x1n2onr6
            www.facebook.com##.xquyuld.x10wlt62.x6ikm8r.xh8yej3.xt3gfkd.xu5ydu1.xdney7k.x1qpq9i9.x2bj2ny.x1ja2u2z.x1n2onr6.x9f619 > .x10wlt62.x6ikm8r .x1ja2u2z.x1n2onr6.x9f619 > .x1y1aw1k.xwib8y2.x9otpla.x1wsgfga.x1ja2u2z.x1n2onr6.x9f619
            www.facebook.com##.xquyuld.x10wlt62.x6ikm8r.xh8yej3.xt3gfkd.xu5ydu1.xdney7k.x1qpq9i9.x2bj2ny.x1ja2u2z.x1n2onr6.x9f619 > div > .xh8yej3.x1n2onr6.x78zum5

            ! YouTube
            ! Inspiration: https://github.com/hadig/Focus-for-Youtube

            ! Removes unnecessary section buttons
            www.youtube.com###items > ytd-guide-entry-renderer[is-primary]:nth-child(1)
            www.youtube.com###items > ytd-guide-entry-renderer[is-primary]:nth-child(2)
            www.youtube.com###items > ytd-guide-entry-renderer[is-primary]:nth-child(3)
            www.youtube.com###items > ytd-guide-entry-renderer[is-primary]:nth-child(4)
            www.youtube.com###items > ytd-guide-entry-renderer[is-primary]:nth-child(5)
            www.youtube.com###guide-renderer > #sections > ytd-guide-section-renderer:nth-child(2) > #items > ytd-guide-entry-renderer:last-child
            www.youtube.com###guide-renderer > #sections > ytd-guide-section-renderer:nth-child(3)
            www.youtube.com###guide-renderer > #sections > ytd-guide-section-renderer:nth-child(4)
            www.youtube.com###guide-renderer > #sections > ytd-guide-section-renderer:nth-child(5)
            www.youtube.com###guide-renderer > #sections > ytd-guide-section-renderer:nth-child(6)
            www.youtube.com##ytd-mini-guide-renderer > #items > ytd-mini-guide-entry-renderer:nth-child(1)
            www.youtube.com##ytd-mini-guide-renderer > #items > ytd-mini-guide-entry-renderer:nth-child(2)
            www.youtube.com##ytd-mini-guide-renderer > #items > ytd-mini-guide-entry-renderer:nth-child(3)
            www.youtube.com##ytd-guide-section-renderer.ytd-guide-renderer.style-scope:nth-of-type(2)
            www.youtube.com###header-entry

            ! Removes video suggestions
            ##.ytp-endscreen-content
            www.youtube.com,youtubekids.com###related
            /annotations_module.js$script,domain=youtube.com|youtu.be|youtube-nocookie.com
            /endscreen.js$script,domain=youtube.com|youtu.be|youtube-nocookie.com
            ||youtube.com/related_ajax^

            ! Aims to prevent video suggestions from showing up when pausing embedded videos
            ##.ytp-scroll-min
            ##.ytp-pause-overlay
            www.youtube.com##.ytp-scroll-min
            www.youtube.com##.ytp-pause-overlay

            ! Removes video epilogue suggestion overlays
            www.youtube.com##.ytp-ce-element-show

            ! Removes a banner that promotes YouTube Premium
            www.youtube.com###masthead-ad

            ! Aims to remove the "Recommended" tickers on top of YouTube embeds
            ##.ytp-cards-teaser

            ! Block "My mix" and autogenerated playlists
            www.youtube.com#?#ytd-compact-radio-renderer:-abp-has(ytd-thumbnail-overlay-bottom-panel-renderer)
            www.youtube.com#?#ytd-rich-item-renderer:-abp-has(ytd-thumbnail-overlay-bottom-panel-renderer)
            www.youtube.com#?#a.ytp-suggestion-set.ytp-videowall-still:has(.ytp-videowall-still-listlabel-mix:not(:matches-css(display: none)))

            ! Playlist recommendations under videos
            www.youtube.com#?#ytd-compact-playlist-renderer:-abp-has(ytd-thumbnail-overlay-side-panel-renderer)

            ! Removes the like/dislike counters
            www.youtube.com##ytd-toggle-button-renderer #text
            www.youtube.com###sentiment

            ! Voice search
            www.youtube.com###voice-search-button

            ! Homepage categories and info banners
            www.youtube.com###header > .ytd-rich-grid-renderer.style-scope
            www.youtube.com##.ytd-rich-section-renderer

            ! Video description metadata
            www.youtube.com###description-inline-expander > .ytd-watch-metadata.style-scope
            www.youtube.com##ytd-rich-metadata-renderer.ytd-rich-metadata-row-renderer

            ! Comments
            www.youtube.com###action-buttons
            www.youtube.com###replies
            www.youtube.com###action-menu
            www.youtube.com###header > .ytd-item-section-renderer.style-scope

            ! Player
            www.youtube.com##button.ytp-button:nth-of-type(7)
            www.youtube.com##.ytp-button.ytp-miniplayer-button
            www.youtube.com##.ytp-cued-thumbnail-overlay
          '';
        };
      };
    };
  };
}
