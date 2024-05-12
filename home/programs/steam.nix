{
  config,
  pkgs,
  lib,
  ...
}: {
  options.settings.steam.enable = lib.mkEnableOption "steam";

  config = lib.mkIf (config.settings.steam.enable) {
    home.packages = [pkgs.adwsteamgtk];
    home.file.".config/AdwSteamGtk/custom.css".source = with config.colorScheme.palette;
      pkgs.writeText "custom.css"
      /*
      css
      */
      ''
        :root
        {
        	--bg: #${base00};
        	--fg: #${base05};
        	--text: #${base07};

        	--headerbar_bg: var(--bg);
        	--popover_bg: var(--bg);
        	--view_bg: var(--bg);

        	/*
        	--accent: #${base0B};
        	--accent_bg: #${base0C};
        	--accent_disabled: var(--accent)80;
        	--accent_hover_bg: var(--accent)12;
        	--accent_active_bg: var(--accent)29;
        	--focusring: var(--accent)80;

        	--destructive: #${base08};
        	--destructive_bg: #${base0E};
        	--destructive_disabled: var(--destructive)80;
        	--destructive_hover_bg: var(--destructive)12;
        	--destructive_active_bg: var(--destructive)29;

        	--success: var(--text);
        	--success_bg: #${base0B};
        	--success_fg: var(--fg);

        	--warning: var(--text);
        	--warning_bg: #${base0A};
        	--warning_fg: var(--fg);

        	--error: var(--text);
        	--error_bg: #${base08};
        	--error_fg: var(--fg);
        	*/
        }

        /* --- EXAMPLE: Hide Whats New --- */
        /* -- DELETE BOTH LINES TO ENABLE
        #SteamDesktop .library_Container_3xRRJ div[class*="libraryhome_UpdatesContainer_"]
        {
        	display: none !important;
        }
        -- DELETE BOTH LINES TO ENABLE */
      '';
  };
}
