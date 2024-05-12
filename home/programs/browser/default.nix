{
  inputs,
  config,
  lib,
  pkgs,
  isNixos ? false,
  ...
}: {
  options.settings.browser.enable = lib.mkEnableOption "browser";

  config = lib.mkMerge [
    (lib.mkIf isNixos {
      programs.firefox.package = null; # defined in system/browser.nix
    })
    (lib.mkIf (config.settings.browser.enable) {
      programs.firefox = {
        enable = true;
        profiles = let
          search = {
            default = "DuckDuckGo";
            force = true;
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
            # TODO: fix this, i don't know how
            extraConfig = ''
              browser.windows.getAll((windows) => {
              	windows.map(window => window.id).forEach(windowId => {
              		browser.windows.update(windowId, { titlePreface: "main: " });
              	});
              });
            '';
          };
          school = {
            settings =
              settings
              // {
                "browser.startup.homepage" = "https://classroom.google.com";
              };
            inherit search userChrome userContent;
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
                    name = "Google";
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
                    ];
                  }
                  {
                    name = "Documents";
                    bookmarks = [
                      {
                        name = "English";
                        url = "https://docs.google.com/document/d/1fquGUpLmUMMek7DTHdjvQruMavTfr6tJNmIAH4druRg";
                        keyword = "english";
                      }
                      {
                        name = "Nynorsk";
                        url = "https://docs.google.com/document/d/1w73sIh5D19GLCMwNcnVr6RWT3P1tJR-vYhTuWIchLkc";
                        keyword = "nynorsk";
                      }
                      {
                        name = "Norsk";
                        url = "https://docs.google.com/document/d/1vxERv5v3p_bf29W4lFLYCYrb6lmTmE0BA3fEVk_05jo";
                        keyword = "norsk";
                      }
                      {
                        name = "KRLE";
                        url = "https://docs.google.com/document/d/1AR2khZxuxV4t5EArsW4xIxmMiq-3avlJM-Zl4uy7dGE";
                        keyword = "krle";
                      }
                      {
                        name = "Samfunnsfag";
                        url = "https://docs.google.com/document/d/1_J0YtBoR9KBSlwHcbBORV32CBMkZhl10xZ2jVr4E5sU";
                        keyword = "samfunns";
                      }
                      {
                        name = "Deutsch";
                        url = "https://docs.google.com/document/d/1B1fZ6ozgUKeJ1kYfpuq8-YH7cV8x8hQc5hCpgaxRqGU";
                        keyword = "deutsch";
                      }
                      {
                        name = "Musikk";
                        url = "https://docs.google.com/document/d/1TY0RT-0pBqRoE8mT_cL9bUKUdR-t2a8gh6nD4UYoir4";
                        keyword = "musikk";
                      }
                      {
                        name = "Matte";
                        url = "https://docs.google.com/document/d/1p1y7etzXHJvmSr4ZiIopA3aYYVOxBGBDfHsplutWOCs";
                        keyword = "matte";
                      }
                      {
                        name = "Naturfag";
                        url = "https://docs.google.com/document/d/1AJx89t6wR48OjouMeb2w8H284AcMhrOZ_TifLaRCNgo";
                        keyword = "natur";
                      }
                      {
                        name = "K&H";
                        url = "https://docs.google.com/document/d/17_xxjVTDNgnStCVm6uKiXDd2FZzGwInBvICP-YcmF1E";
                        keyword = "kunst";
                      }
                    ];
                  }
                ];
              }
            ];
          };
          math = {
            settings =
              settings
              // {
                "browser.startup.homepage" = "https://skole.digilaer.no/auth/saml/index.php?wantsurl=https%3A%2F%2Fskole.digilaer.no%2Fmy%2F";
              };
            inherit search userChrome userContent;
            extensions = with inputs.firefox-addons.packages."${pkgs.system}"; [
              darkreader
              ublock-origin
            ];
            id = 2;
            bookmarks = [
              {
                name = "Toolbar";
                toolbar = true;
                bookmarks = [
                  {
                    name = "Digilær";
                    url = "https://skole.digilaer.no/auth/saml/index.php?wantsurl=https%3A%2F%2Fskole.digilaer.no%2Fmy%2F";
                    keyword = "digilær";
                  }
                  {
                    name = "Digilær Møte";
                    url = "https://skole.digilaer.no/auth/saml/index.php?wantsurl=https%3A%2F%2Fskole.digilaer.no%2Fmod%2Fadobeconnect%2Fview.php%3Fid%3D13352";
                    keyword = "møte";
                  }
                  {
                    name = "GeoGebra";
                    url = "https://geogebra.org/classic";
                    keyword = "geogebra";
                  }
                  {
                    name = "Symbolab";
                    url = "https://symbolab.com";
                    keyword = "symbo";
                  }
                ];
              }
            ];
          };
        };
      };

      xdg.mimeApps.defaultApplications = {
        "text/html" = ["firefox.desktop"];
        "text/xml" = ["firefox.desktop"];
        "x-scheme-handler/http" = ["firefox.desktop"];
        "x-scheme-handler/https" = ["firefox.desktop"];
      };
    })
  ];
}
