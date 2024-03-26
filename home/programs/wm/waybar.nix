{ config, pkgs, lib, ... }:

{
	options.settings.waybar.enable = lib.mkOption {
		type = lib.types.bool;
		default = false;
	};

	config = let
		layer = "top";
		margin-top = 0;
		margin-bottom = 0;
		spacing = 5;
		height = 24;

		modules-left = [ "hyprland/workspaces" ];
		modules-center = [ "clock" ];
		modules-right = [ "tray" ];

		format = "{icon}";
		format-icons = {
			urgent = "󰀨";
			focused = "";
			active = "";
			default = "";
		};

		clock = {
			timezone = "Europe/Oslo";
			interval = 1;
			format = "{:%d.%m.%Y %H:%M}";
			format-alt = "{:%A %d. %B %Y, Uke %V, %H:%M:%S}";
		};

		tray = {
			icon-size = 20;
			spacing = 10;
		};
	in lib.mkIf (config.settings.waybar.enable) {
		programs.waybar = {
			enable = true;
			settings = {
				primaryBar = {
					output = "HDMI-A-2";
					inherit layer;
					inherit margin-top;
					inherit margin-bottom;
					inherit spacing;
					inherit height;

					inherit modules-left;
					inherit modules-center;
					inherit modules-right;

					"hyprland/workspaces" = {
						inherit format;
						inherit format-icons;
						persistent-workspaces = {
							"1" = [];
							"2" = [];
							"3" = [];
							"4" = [];
							"5" = [];
						};
					};
					inherit clock;
					inherit tray;
				};
				secondaryBar = {
					output = "DP-2";
					inherit layer;
					inherit margin-top;
					inherit margin-bottom;
					inherit spacing;
					inherit height;

					inherit modules-left;
					inherit modules-center;
					inherit modules-right;

					"hyprland/workspaces" = {
						inherit format;
						inherit format-icons;
						persistent-workspaces = {
							"11" = [];
							"12" = [];
							"13" = [];
							"14" = [];
							"15" = [];
						};
					};
					inherit clock;
					inherit tray;
				};
			};
			style = with config.colorScheme.palette; /*css*/ ''
				* {
					font-family: JetBrainsMono Nerd Font;
					font-size: 16px;
					/*color: #${base05}*/
					border: none;
					border-radius: 0;
				}
				
				window#waybar {
					background-color: alpha(#${base00}, 0.6);
					color: #${base05};
					transition-property: background-color;
					transition-duration: .5s;
				}
				
				#workspaces button {
					padding: 0 5px;
					background-color: transparent;
					color: #${base05};
					transition-property: background-color;
					transition-duration: .5s;
				}
				
				#workspaces button:hover {
					color: mix(#${base05}, #${base00}, 0.3);
				}
				
				#workspaces button.active {
					color: #${base07};
				}
				
				#workspaces button.urgent {
					color: #${base08};
				}
				
				#tray menu {
					background-color: #${base00};
				}
			'';
		};
	};
}
