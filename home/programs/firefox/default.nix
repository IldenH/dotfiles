{
  inputs,
  config,
  lib,
  pkgs,
  isNixos ? false,
  ...
}: {
  config = lib.mkMerge [
    (lib.mkIf isNixos {
      programs.firefox.package = null; # defined in system
    })
    (lib.mkIf config.programs.firefox.enable {
      programs.firefox.profiles = let
        search = {
          default = "DuckDuckGo";
          force = true;
          engines = {
            "Bing".metaData.hidden = true;
            "Google".metaData.hidden = true;
            "Wikipedia (en)".metaData.hidden = true;
          };
        };
        settings = import ./settings.nix;
        extensions = import ./extensions {inherit inputs pkgs;};
        userChrome = import ./userChrome.nix {inherit config;};
        userContent = import ./userContent.nix;
      in {
        main = {
          settings =
            settings
            // {
              "identity.fxaccounts.enabled" = true; # shouldn't be using, but it works
            };
          inherit search extensions userChrome userContent;
          isDefault = true;
          id = 0;
          bookmarks = [];
        };
        school = {
          inherit settings search userChrome userContent;
          extensions = with inputs.firefox-addons.packages."${pkgs.system}"; [
            darkreader
            ublock-origin
          ];
          id = 1;
          bookmarks = [
            {
              name = "Toolbar";
              toolbar = true;
              bookmarks = [
                {
                  name = "School";
                  bookmarks = [
                    {
                      name = "Classroom";
                      url = "https://classroom.google.com";
                      keyword = "class";
                    }
                    {
                      name = "Docs";
                      url = "https://docs.google.com";
                      keyword = "docs";
                    }
                    {
                      name = "Slides";
                      url = "https://slides.google.com";
                      keyword = "slides";
                    }
                    {
                      name = "Sheets";
                      url = "https://sheets.google.com";
                      keyword = "sheets";
                    }
                    {
                      name = "Drive";
                      url = "https://drive.google.com";
                      keyword = "drive";
                    }
                    {
                      name = "Office";
                      url = "https://office.com";
                      keyword = "office";
                    }
                  ];
                }
              ];
            }
          ];
        };
      };

      xdg.mimeApps.defaultApplications = {
        "text/xml" = "firefox.desktop";
        "text/html" = "firefox.desktop";

        "x-scheme-handler/ftp" = "firefox.desktop";
        "x-scheme-handler/http" = "firefox.desktop";
        "x-scheme-handler/https" = "firefox.desktop";
        "x-scheme-handler/chrome" = "firefox.desktop";

        "application/xhtml+xml" = "firefox.desktop";
        "application/x-extension-htm" = "firefox.desktop";
        "application/x-extension-xht" = "firefox.desktop";
        "application/x-extension-html" = "firefox.desktop";
        "application/x-extension-shtml" = "firefox.desktop";
        "application/x-extension-xhtml" = "firefox.desktop";
      };
    })
  ];
}
