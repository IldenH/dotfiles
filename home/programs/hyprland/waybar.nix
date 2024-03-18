{ config, pkgs, ... }:

let
	background = config.colorScheme.palette.base00;
	alt_background = config.colorScheme.palette.base01;
	alt2_background = config.colorScheme.palette.base02;
	alt3_background = config.colorScheme.palette.base03;
	
	dark_foreground = config.colorScheme.palette.base04;
	foreground = config.colorScheme.palette.base05;
	alt_foreground = config.colorScheme.palette.base06;
	alt2_foreground = config.colorScheme.palette.base07;

	red = config.colorScheme.palette.base08;
	orange = config.colorScheme.palette.base09;
	yellow = config.colorScheme.palette.base0A;
	green = config.colorScheme.palette.base0B;
	cyan = config.colorScheme.palette.base0C;
	blue = config.colorScheme.palette.base0D;
	purple = config.colorScheme.palette.base0E;
	brown = config.colorScheme.palette.base0F;
in
{
	programs.waybar = {
		enable = true;
		settings = {
			mainBar = {
				layer = "top";
				margin-top = 0;
				margin-bottom = 0;
				spacing = 5;
				height = 26;

				modules-left = [ "hyprland/workspaces" ];
				modules-center = [ "clock" ];
				modules-right = [ "battery" "tray" "custom/wlogout" ];

				"hyprland/workspaces" = {
					on-scroll-up = "hyprctl dispatch workspace e+1";
					on-scroll-down = "hyprctl dispatch workspace e-1";
					format = "{icon}";
					format-icons = {
						# "1" = "";
						# "2" = "󰈹";
						urgent = "󰀨";
						focused = "";
						active = "";
						default = "";
					};
					persistent-workspaces = {
						"1" = [];
						"2" = [];
						"3" = [];
						"4" = [];
						"5" = [];
						# "6" = [];
						# "7" = [];
						# "8" = [];
						# "9" = [];
					};
				};

				"backlight/slider" = { # The slider is very slow and jumps around
					min = 0;
					max = 100;
					orientation = "horizontal";
					device = "intel_backlight";
				};

				"battery" = {
					interval = 60;
					states = {
						warning = 30;
						critical = 15;
					};
					format = "{capacity}% {icon}";
					format-icons = [ " " " " " " " " " " ];
				};

				"clock" = {
					# max-length = 25;
					timezone = "Europe/Oslo";
					interval = 60;
					format = "{:%H:%M}";
					format-alt = "{:%A, %d %B, %Y (%H:%M)}";
					tooltip-format = "<tt><small>{calendar}</small></tt>";
					calendar = {
						mode = "month";
						mode-mon-col = 3;
						weeks-pos = "right";
						on-scroll = 1;
						on-click-right = "mode";
						format = {
							months = "<span color='#${foreground}'><b>{}</b></span>";
							days = "<span color='#${purple}'><b>{}</b></span>";
							weeks = "<span color='#${orange}'><b>{}</b></span>";
							weekdays = "<span color='#${blue}'><b>{}</b></span>";
							today = "<span color='#${red}'><b><u>{}</u></b></span>";
						};
					};
					actions = {
						on-click-right = "mode";
						on-scroll-up = "shift_up";
						on-scroll-down = "shift-down";
					};
				};

				"tray" = {
					icon-size = 20;
					spacing = 10;
				};

				"custom/wlogout" = {
					format = " ";
					on-click = "wlogout";
				};

			};
		};

		style = with config.colorScheme.palette; /*css*/ ''
@define-color background #${base00};
@define-color alt_background #${base01};
@define-color alt2_background #${base02};
@define-color alt3_background #${base03};

@define-color dark_foreground #${base04};
@define-color foreground #${base05};
@define-color alt_foreground #${base06};
@define-color alt2_foreground #${base07};

@define-color red #${base08};
@define-color orange #${base09};
@define-color yellow #${base0A};
@define-color green #${base0B};
@define-color cyan #${base0C};
@define-color blue #${base0D};
@define-color purple #${base0E};
@define-color brown #${base0F};

@define-color bar_background alpha(@background, 0.6);

* {
	font-family: JetBrainsMono Nerd Font;
	font-size: 16px;
	/*color: @foreground*/
	border: none;
	border-radius: 0;
}

window#waybar {
	background-color: @bar_background;
	color: @foreground;
	transition-property: background-color;
	transition-duration: .5s;
}

#workspaces button {
	padding: 0 5px;
	background-color: transparent;
	color: @foreground;
	transition-property: background-color;
	transition-duration: .5s;
}

#workspaces button:hover {
	color: mix(@foreground, @background, 0.3);
}

#workspaces button.active {
	color: @alt2_foreground;
}

#workspaces button.urgent {
	color: @red;
}

#backlight-slider {
	min-width: 60px;
}

#tray menu {
	background-color: @background;
}

#battery.charging {
	color: @green;
}

#battery.warning {
	color: @yellow;
}

#battery.critical {
	color: @red;
}
		'';

	};
}
