{ config, global }:

# Auto-generated color scheme, inspired by https://github.com/deathbeam/base16-discord
with config.colorScheme.palette; ''
	/**
	* @name ${config.colorScheme.name}
	* @author ${global.user.description}
	* @version 1.0.0
	* @description Base16 color scheme generated from https://github.com/Misterio77/nix-colors
	**/

  @import url(https://mwittrien.github.io/BetterDiscordAddons/Themes/SettingsModal/SettingsModal.css);
	
	:root {
		/* settings modal */
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
		--text-secondary: #${base00};
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

  code {
    border-radius: 6px !important;
  }

  code.inline {
    padding: 3px !important;
  }

	/* message input */
	.scrollableContainer_ff917f {
		padding-right: 0px !important;
	}

  /* name titlebar */
  .title_d4ba1a {
    padding: 0 !important;
  }

  /* top-bar separator */
  .searchBar__621ec {
    box-shadow: none !important;
  }

	.banner__6d414, .panelBanner__7d7e2, .bannerPremium__69560 {
		background-color: transparent !important;
		background-image: none !important;
	}

	.scroller_e412fe {
		scrollbar-width: none !important;
	}

  /* message input buttons, locale based */
  button[aria-label="ギフトを贈る"],
  button[aria-label="GIFピッカーを開く"],
  button[aria-label="スタンプピッカーを開く"],
  .channelTextArea-1FufC0 > .container-1ZA19X,

  /* top-bar buttons, locale based */
  a[href="https://support.discord.com"],
  [aria-label="ビデオ通話を開始"],
  [aria-label="受信ボックス"],

  /* message input square */
  .form_d8a4a1::after,

  /* shop and nitro buttons */
  a[data-list-item-id="private-channels-uid_18___nitro"],
  a[data-list-item-id="private-channels-uid_18___shop"],
  a[href="/shop"],
  a[href="/store"],

  .divider_bdb894, .akaBadge__27cd4, .nicknames__12efb,

  /* server list separator */
  .guildSeparator__75928 {
    display: none !important;
  }
''
