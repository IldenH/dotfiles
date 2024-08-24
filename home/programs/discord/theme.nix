{
  config,
  global,
}:
with config.colorScheme.palette;
/*
css
*/
  ''
    /**
    * @name ${config.colorScheme.name}
    * @author ${global.user.description}
    * @description Base16 color scheme generated from https://github.com/Misterio77/nix-colors
    **/

    @import url(https://mwittrien.github.io/BetterDiscordAddons/Themes/SettingsModal/SettingsModal.css);

    :root {
      --settingswidth: 960;
      --settingsheight: 80;
      --settingsbackground: transparent;

      --primary-630: #${base00}; /* Autocomplete background */
      --primary-660: #${base00}; /* Search input background */
    }

    .theme-light, .theme-dark {
      --search-popout-option-fade: none; /* Disable fade for search popout */
      --bg-overlay-2: #${base00}; /* These 2 are needed for proper threads coloring */
      --home-background: #${base00};
      --background-primary: #${base00};
      --background-secondary: #${base00};
      --background-secondary-alt: #${base00};
      --channeltextarea-background: #${base01};
      --background-tertiary: #${base00};
      --background-accent: #${base0E};
      --background-floating: #${base00};
      --background-modifier-selected: #${base00};
      --text-normal: #${base05};
      --text-secondary: #${base04};
      --text-muted: #${base03};
      --text-link: #${base0C};
      --interactive-normal: #${base04};
      --interactive-hover: #${base0A};
      --interactive-active: #${base0A};
      --interactive-muted: #${base03};
      --header-primary: #${base0E};
      --header-secondary: #${base04};
      --scrollbar-thin-track: transparent;
      --scrollbar-auto-track: transparent;
    }

    * {
      scrollbar-width: none !important;
    }

    code {border-radius: 6px !important;}
    code.inline {padding: 3px !important;}

    .scrollableContainer_ff917f, /* message input */
    .title_d4ba1a {padding: 0 !important;}
    .inner__9fd0b /* message input */ {padding-right: 12px;}
    .searchBar__621ec /* top-bar separator */ {box-shadow: none !important;}

    .banner__6d414, .panelBanner__7d7e2, .bannerPremium__69560 {
      background-color: transparent !important;
      background-image: none !important;
    }

    /* buttons, locale based */
    [aria-label="ギフトを贈る"],
    [aria-label="GIFピッカーを開く"],
    [aria-label="スタンプピッカーを開く"],
    [aria-label="ビデオ通話を開始"],
    [aria-label="受信ボックス"],
    .channelTextArea-1FufC0 > .container-1ZA19X,
    [href="https://support.discord.com"],
    [href="/shop"],
    [href="/store"],
    [class^="profileEffects"],
    [class^="avatarDecoration"],
    .form_d8a4a1::after,
    .divider_bdb894, .akaBadge__27cd4, .nicknames__12efb,
    .closeButton__116c3,
    .guildSeparator__75928,
    .vc-notification-root {display: none !important;}
  ''
