{ inputs, config, lib, pkgs, ... }:

{
	options.settings.browser.enable = lib.mkEnableOption "browser";

	config = let
		search = {
			default = "DuckDuckGo";
			force = true;
		};

		# Settings are stored in ~/.mozilla/firefox/profile_name/prefs.js
		# To find the name of a setting, either use `diff old_settings new_settings`
		# Or check which value changes in about:config when setting it in about:preferences
		settingsWithHomepage = homepage: {
			"browser.startup.homepage" = homepage;

			# download
			"browser.download.panel.shown" = true;
			"browser.download.useDownloadDir" = true;

			# first run
			"app.normandy.first_run" = false;
			"doh-rollout.doneFirstRun" = true;

			# privacy
			"dom.security.https_only_mode" = true;
			"identity.fxaccounts.enabled" = false;
			"signon.rememberSignons" = false;

			"privacy.trackingprotection.enabled" = true;
			"privacy.donottrackheader.enabled" = true;
			"privacy.fingerprintingProtection.enabled" = true;
			"privacy.globalprivacycontrol.enabled" = true;

			# no thanks mozilla
			"app.shield.optoutstudies.enabled" = true;
			"datareporting.healthreport.uploadEnabled" = false;
			"toolkit.telemetry.pioneer-new-studies-available" = false;
			"browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
			"browser.contentblocking.report.show_mobile_app" = false;

			# i don't know what is but probably good
			"browser.shell.checkDefaultBrowser" = false;
			"browser.shell.defaultBrowserCheckCount" = 1;
			"toolkit.legacyUserProfileCustomizations.stylesheets" = true;
			"browser.startup.homepage_override.mstone" = "ignore";

			"media.hardware-video-decoding.force-enabled" = true;
			"layers.acceleration.force-enabled" = true;

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
			"browser.startup.page" = 3; # Restore pages on startup
			"general.autoScroll" = true;
			"browser.aboutConfig.showWarning" = false;
			"browser.disableResetPrompt" = true;
			"widget.gtk.overlay-scrollbars.enabled" = false;

			# ui
			"browser.tabs.firefox-view" = false;
			"browser.tabs.tabmanager.enabled" = false;
			"browser.toolbars.bookmarks.visibility" = "newtab";

			# extensions
			"extensions.webextensions.ExtensionStorageIDB.migrated.@contain-facebook" = true;
			"extensions.webextensions.ExtensionStorageIDB.migrated.addon@darkreader.org" = true;
			"extensions.webextensions.ExtensionStorageIDB.migrated.sponsorBlocker@ajay.app" = true;
			"extensions.webextensions.ExtensionStorageIDB.migrated.uBlock0@raymondhill.net" = true;
			"extensions.webextensions.ExtensionStorageIDB.migrated.jid1-KKzOGWgsW3Ao4Q@jetpack" = true;
			"extensions.webextensions.ExtensionStorageIDB.migrated.jid1-MnnxcxisBPnSXQ@jetpack" = true;
			"extensions.webextensions.ExtensionStorageIDB.migrated.{446900e4-71c2-419f-a6a7-df9c091e268b}" = true;
			"extensions.webextensions.ExtensionStorageIDB.migrated.{74145f27-f039-47ce-a470-a662b129930a}" = true;
			"extensions.webextensions.ExtensionStorageIDB.migrated.{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}" = true;

			# long string
			"browser.uiCustomization.state" = 
			''
{"placements":{"widget-overflow-fixed-list":[],"unified-extensions-area":["jid1-mnnxcxisbpnsxq_jetpack-browser-action","_74145f27-f039-47ce-a470-a662b129930a_-browser-action","_contain-facebook-browser-action","dfyoutube_example_com-browser-action","jid1-kkzogwgsw3ao4q_jetpack-browser-action","addon_simplelogin-browser-action","sponsorblocker_ajay_app-browser-action","_34daeb50-c2d2-4f14-886a-7160b24d66a4_-browser-action","_9a41dee2-b924-4161-a971-7fb35c053a4a_-browser-action"],"nav-bar":["back-button","forward-button","stop-reload-button","urlbar-container","downloads-button","fxa-toolbar-menu-button","addon_darkreader_org-browser-action","_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action","ublock0_raymondhill_net-browser-action","_7a7a4a92-a2a0-41d1-9fd7-1e92480d612d_-browser-action","unified-extensions-button"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["tabbrowser-tabs","new-tab-button","alltabs-button"],"PersonalToolbar":[]},"seen":["save-to-pocket-button","developer-button","_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action","_74145f27-f039-47ce-a470-a662b129930a_-browser-action","addon_darkreader_org-browser-action","dfyoutube_example_com-browser-action","_9a41dee2-b924-4161-a971-7fb35c053a4a_-browser-action","_contain-facebook-browser-action","jid1-kkzogwgsw3ao4q_jetpack-browser-action","jid1-mnnxcxisbpnsxq_jetpack-browser-action","addon_simplelogin-browser-action","sponsorblocker_ajay_app-browser-action","_7a7a4a92-a2a0-41d1-9fd7-1e92480d612d_-browser-action","ublock0_raymondhill_net-browser-action","_34daeb50-c2d2-4f14-886a-7160b24d66a4_-browser-action"],"dirtyAreaCache":["nav-bar","PersonalToolbar","unified-extensions-area","TabsToolbar"],"currentVersion":20,"newElementCount":4}
			'';
		};

		# All available extensions:
		# https://gitlab.com/rycee/nur-expressions/-/blob/master/pkgs/firefox-addons/addons.json?ref_type=heads
		extensions = with inputs.firefox-addons.packages."${pkgs.system}"; [
			bitwarden
			clearurls
			darkreader
			df-youtube
			enhanced-h264ify
			facebook-container
			i-dont-care-about-cookies
			privacy-badger
			simplelogin
			sponsorblock
			stylus
			# tampermonkey # unfree might change to grease monkey
			ublock-origin
			youtube-shorts-block

			# firefox-color # nix-colors?
			
			# buildFirefoxXpiAddon not found, i don't know how to fix
			# (buildFirefoxXpiAddon {
			# 	pname = "yomitan";
			# 	version = "23.12.29.0";
			# 	addonId = "{6b733b82-9261-47ee-a595-2dda294a4d08}"; # use sha256 to find this in .mozilla/firefox/<profile>/extensions
			# 	url = "https://addons.mozilla.org/firefox/downloads/file/4217782/yomitan-23.12.29.0.xpi"; # "Add to Firefox" button link
			# 	sha256 = "6cff708019bd5c53879b3c50ddb6b1f49e842d1c47272c10569041a2d3dbcd60";
			# 	meta = {};
			# })
		];

		# lilleaila/dotfiles
		colorTab = bg: fg: ''
		.tab-background[selected] {
			background-color: #${bg} !important;
			background-image: none !important;
		}
		.tab-content[selected] {
			color: #${fg} !important;
		}
		'';
	in lib.mkIf (config.settings.browser.enable) {
		programs.firefox = {
			enable = true;
			profiles.main = {
				settings = settingsWithHomepage "";
				inherit search;
				inherit extensions;
				isDefault = true;
				id = 0;
				bookmarks = [ ];
				userChrome = with config.colorScheme.palette; colorTab base04 base00;
			};
			profiles.school = {
				settings = settingsWithHomepage "https://classroom.google.com";
				inherit search;
				inherit extensions;
				id = 1;
				bookmarks = [{
					name = "Toolbar";
					toolbar = true;
					bookmarks = [
						{
							name = "Google";
							bookmarks = [
								{ name = "Classroom"; url = "https://classroom.google.com"; keyword = "class"; }
								{ name = "Docs"; url = "https://docs.google.com"; keyword = "docs"; }
								{ name = "Slides"; url = "https://slides.google.com"; keyword = "slides"; }
								{ name = "Sheets"; url = "https://sheets.google.com"; keyword = "sheets"; }
								{ name = "Drive"; url = "https://drive.google.com"; keyword = "drive"; }
							];
						}
						{
							name = "Documents";
							bookmarks = [
								{ name = "English"; url = ""; keyword = "english"; }
								{ name = "Nynorsk"; url = ""; keyword = "nynorsk"; }
								{ name = "Norsk"; url = ""; keyword = "norsk"; }
								{ name = "KRLE"; url = ""; keyword = "krle"; }
								{ name = "Samfunnsfag"; url = ""; keyword = "samfunns"; }
								{ name = "Deutsch"; url = ""; keyword = "deutsch"; }
								{ name = "Musikk"; url = ""; keyword = "musikk"; }
								{ name = "Matte"; url = ""; keyword = "matte"; }
								{ name = "Naturfag"; url = ""; keyword = "natur"; }
								{ name = "K&H"; url = ""; keyword = "kunst"; }
							];
						}
					];
				}];
				userChrome = with config.colorScheme.palette; colorTab base0C base00;
			};
			profiles.math = {
				settings = settingsWithHomepage "https://skole.digilaer.no/auth/saml/index.php?wantsurl=https%3A%2F%2Fskole.digilaer.no%2Fmy%2F";
				inherit search;
				inherit extensions;
				id = 2;
				bookmarks = [{
					name = "Toolbar";
					toolbar = true;
					bookmarks = [
						{ name = "Digilær"; url = "https://skole.digilaer.no/auth/saml/index.php?wantsurl=https%3A%2F%2Fskole.digilaer.no%2Fmy%2F"; keyword = "digilær"; }
						{ name = "Digilær Møte"; url = "https://skole.digilaer.no/auth/saml/index.php?wantsurl=https%3A%2F%2Fskole.digilaer.no%2Fmod%2Fadobeconnect%2Fview.php%3Fid%3D13352"; keyword = "møte"; }
						{ name = "GeoGebra"; url = "https://geogebra.org/classic"; keyword = "geogebra"; }
						{ name = "Symbolab"; url = "https://symbolab.com"; keyword = "symbo"; }
					];
				}];
				userChrome = with config.colorScheme.palette; colorTab base0D base00;
			};
		};

		xdg.mimeApps.defaultApplications = {
			"text/html" = [ "firefox.desktop" ];
			"text/xml" = [ "firefox.desktop" ];
			"x-scheme-handler/http" = [ "firefox.desktop" ];
			"x-scheme-handler/https" = [ "firefox.desktop" ];
		};
	};
}
