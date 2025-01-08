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
        ];

        users.${global.user.name} = {
          files = [];
          directories = [
            ".tldrc/tldr/pages"
            ".cache/mozilla"

            ".gnupg"
            ".ssh"

            ".cargo"
            ".npm"

            ".local/state/wireplumber"
            ".local/share/direnv"
            ".local/share/nvim"
            ".local/state/nvim"
            ".local/share/zoxide"

            ".config/hypr"
            ".config/vesktop"
            ".config/syncthing"
            ".config/heroic"
            ".config/gh"
            ".config/obsidian"

            ".steam"
            ".local/share/Steam"
          ];
        };
      };
    };
  };
}
