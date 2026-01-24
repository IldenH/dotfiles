{
  lib,
  inputs,
  config,
  global,
  ...
}: {
  options.settings.impermanence.enable = lib.mkEnableOption "impermanence";

  imports = [
    inputs.impermanence.nixosModules.impermanence
  ];

  config = lib.mkIf config.settings.impermanence.enable {
    boot.tmp.cleanOnBoot = true;

    fileSystems."/" = {
      device = "tmpfs";
      fsType = "tmpfs";
      neededForBoot = true;
      options = [
        "defaults"
        "size=1G"
        "mode=755"
      ];
    };

    # disable the inital message about using sudo
    security.sudo.extraConfig = "Defaults lecture=never";

    environment.persistence = {
      "/persist" = {
        hideMounts = true;
        files = [];
        directories = [
          "/var/log"
          "/var/lib/nixos"
          "/var/lib/hass"
          "/var/lib/waydroid"
        ];

        users.${global.user.name} = {
          files = [
            ".zsh_history"
          ];
          directories = [
            "Downloads"
            "Music"
            "Pictures"
            "Documents"
            "Videos"

            "Sync"
            "Games"
            "dev"
            "Vault"

            ".mozilla"
            ".factorio"
            ".minecraft"
            ".spell"

            ".zotero"
            "Zotero"
            "Calibre Library"

            ".local/share/Anki2"
            ".local/share/openttd"
            ".local/share/osu"
            ".local/share/PrismLauncher"

            ".config/calibre"
            ".config/GeoGebra"
            ".config/libreoffice"
            ".config/mozc"
            ".config/obs-studio"
            ".config/openttd"
            ".config/teams-for-linux"
            ".config/xournalpp"
            ".config/unity3d"
            ".config/Blockbench"

            ".config/FreeCAD"
            ".local/share/kicad"
            ".config/kicad"

            ".var/app"
          ];
        };
      };

      "/persist/cache" = {
        hideMounts = true;
        files = [];
        directories = [
          "/var/lib/systemd/backlight"
          "/var/lib/docker"
          "/etc/NetworkManager/system-connections"
          "/var/lib/bluetooth"
          "/var/lib/alsa"
          "/var/lib/libretranslate"
          "/var/lib/flatpak"
          "/var/cache/fwupd"
          "/var/lib/fwupd"
        ];

        users.${global.user.name} = {
          files = [];
          directories = [
            "Arduino"
            ".arduino15"

            ".tldrc/tldr/pages"

            ".cache/mozilla"
            ".cache/chromium"
            ".config/chromium"

            ".gnupg"
            ".ssh"

            ".cargo"
            ".npm"
            ".cache/typst"
            ".cache/zellij"
            ".cache/cabal"

            ".local/state/wireplumber"
            ".local/share/direnv"
            ".local/share/zoxide"
            ".local/share/bottles"
            ".local/share/kiwix"
            ".local/share/docker"
            ".local/share/argos-translate"
            ".local/share/endelay"

            ".local/share/flatpak"
            ".cache/flatpak"

            ".local/share/qutebrowser"
            ".cache/qutebrowser"

            ".config/hypr"
            ".config/vesktop"
            ".config/heroic"
            ".config/gh"
            ".config/obsidian"

            ".steam"
            ".local/share/Steam"

            ".config/syncthing"
            ".cache/syncthing"

            ".cache/nix"
            ".cache/nvf"
            ".local/share/nvf"
            ".local/state/nvf"
            ".local/share/nvim"
            ".local/state/nvim"

            ".cache/kicad"
            ".local/share/FreeCAD"
            ".cache/FreeCAD"
          ];
        };
      };
    };
  };
}
