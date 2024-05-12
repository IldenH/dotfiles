{
  config,
  pkgs,
  lib,
  ...
}: {
  options.settings.waybar.enable = lib.mkEnableOption "waybar";

  config.programs.waybar = lib.mkIf (config.settings.waybar.enable) {
    enable = true;
    settings.bar = {
      layer = "top";

      modules-left = ["hyprland/workspaces"];
      modules-center = ["clock"];
      modules-right = ["tray"];

      "hyprland/workspaces" = {
        format = "{icon}";
        format-icons = {
          urgent = "󰀨";
          focused = "";
          active = "";
          default = "";
        };
        persistent-workspaces = {
          "*" = [1 2 3 4 5]; # works fine as other hosts aren't multi-monitor
          "DP-2" = [11 12 13 14 15]; # secondary monitor for Desktop
        };
      };

      # TODO: make options for this
      clock = {
        timezone = "Europe/Oslo";
        interval = 1;
        format = "{:%d.%m.%Y %H:%M}";
        format-alt = "{:%A %d. %B %Y, Uke %V, %H:%M:%S}";
      };
    };
    style = with config.colorScheme.palette; ''
      * {
      	font-family: JetBrainsMono Nerd Font;
      	font-size: 16px;
      	border: none;
      	border-radius: 0;
      }

      window#waybar {
      	background-color: alpha(#${base00}, 0.6);
      	color: #${base05};
      }

      #workspaces button {
      	padding: 0 5px;
      	background-color: transparent;
      	color: #${base05};
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
    '';
  };
}
