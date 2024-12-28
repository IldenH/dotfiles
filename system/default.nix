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
        adb.enable = true;
      };

      users.users.${global.user.name}.extraGroups = ["adbusers"];

      users.defaultUserShell = pkgs.zsh;

      programs.nh = {
        enable = true;
        flake = "/home/${global.user.name}/dev/dotfiles";
        clean.enable = true;
        clean.extraArgs = "--keep-since 4d --keep 5 --nogcroots";
      };

      environment.systemPackages = with pkgs; [
        curl
        wget
      ];
    })
    (lib.mkIf config.hm.settings.cli.enable {
      programs.gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
      };
    })
  ];
}
