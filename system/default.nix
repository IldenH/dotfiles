{
  lib,
  pkgs,
  config,
  global,
  ...
}: {
  imports = [
    ./console.nix
    ./desktop
    ./docker.nix
    ./greeter.nix
    ./grub.nix
    ./home-assistant.nix
    ./locale.nix
    ./networking.nix
    ./nix.nix
    ./graphics.nix
    ./school.nix
    ./syncthing.nix
    ./user.nix
    ./zfs
  ];

  options.settings.utils.enable = lib.mkEnableOption "utils" // {default = true;};

  config = lib.mkMerge [
    (lib.mkIf config.settings.utils.enable {
      services = {
        fstrim.enable = true;
        gvfs.enable = true;
        upower.enable = true;
        fwupd.enable = true;
      };

      programs = {
        zsh.enable = true;
        dconf.enable = true;
        nano.enable = false;
      };

      users.users.${global.user.name}.extraGroups = ["adbusers"];

      users.defaultUserShell = pkgs.zsh;

      environment.systemPackages = with pkgs; [
        curl
        wget
        android-tools
      ];
    })
    (lib.mkIf config.hm.settings.cli.enable {
      programs.gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
      };
    })
    {
      # needed for zotero https://github.com/NixOS/nixpkgs/issues/568692
      # TODO: remove when zotero 11
      nixpkgs.config.permittedInsecurePackages = [
        "firefox-esr-140-bin-unwrapped-140.17.0esr"
      ];
    }
  ];
}
