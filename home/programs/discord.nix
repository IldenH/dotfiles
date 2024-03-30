{ config, pkgs, inputs, lib, global, ... }:

{
	options.settings.discord.enable = lib.mkEnableOption "discord";

	config = let
		conf = ''$HOME/.config/vesktop/'';
	in lib.mkMerge [
		(lib.mkIf (config.settings.discord.enable) {
			home.packages = with pkgs; [
				vesktop
			];

			# I don't like this, but makes vesktop crash less frequently
			home.file.".config/vesktop/init-settings.json" = {
				text = ''
				{
					"discordBranch": "stable",
					"minimizeToTray": false,
					"arRPC": false,
					"disableMinSize": true,
					"staticTitle": true,
					"splashTheming": true,
					"checkUpdates": false
    			"tray": false,
    			"hardwareAcceleration": false
				}
				'';
				onChange = ''
					rm -f ${conf}settings.json
					cp ${conf}init-settings.json ${conf}settings.json
					chmod u+w ${conf}settings.json
				'';
			};

			home.file.".config/vesktop/settings/init-settings.json" = {
				source = ./discord-settings.json;
				onChange = ''
					rm -f ${conf}settings/settings.json
					cp ${conf}settings/init-settings.json ${conf}settings/settings.json
					chmod u+w ${conf}settings/settings.json
				'';
			};

			# Auto-generated color scheme, inspired by https://github.com/deathbeam/base16-discord
			home.file.".config/vesktop/themes/base16.theme.css".text = with config.colorScheme.palette; ''
				/**
				* @name ${config.colorScheme.name}
				* @author ${global.user.description}
				* @version 1.0.0
				* @description Base16 color scheme generated from https://github.com/Misterio77/nix-colors
				**/
				
				:root {
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
			'';
		})
		(lib.mkIf (config.settings.hyprland.enable) {
			wayland.windowManager.hyprland.settings = {
				"$discord" = "vesktop";

				bind = [
					"SHIFT_ALT, M, exec, $discord"
				];
				windowrulev2 = [
					"workspace 13, class:($discord)"
				];
			};
		})
	];
}
