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
    ./greeter.nix
    ./grub.nix
    ./locale.nix
    ./networking.nix
    ./nix.nix
    ./nvidia.nix
    ./user.nix
  ];

  options.settings = {
    utils.enable = lib.mkEnableOption "utils" // {default = true;};
    sound.enable = lib.mkEnableOption "sound";
  };

  config = lib.mkMerge [
    (lib.mkIf config.settings.utils.enable {
      services = {
        printing.enable = true;
        fstrim.enable = true;
        gvfs.enable = true;
        upower.enable = true;
      };

      programs = {
        zsh.enable = true;
        dconf.enable = true;
        nano.enable = false;
      };

      users.defaultUserShell = pkgs.zsh;

      programs.nh = {
        enable = true;
        flake = "/home/${global.user.name}/dotfiles";
        clean.enable = true;
        clean.extraArgs = "--keep-since 4d --keep 5 --nogcroots";
      };

      environment.systemPackages = with pkgs; [
        curl
        wget
      ];
    })
    (lib.mkIf config.settings.sound.enable {
      security.rtkit.enable = true;
      services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
      };
    })
    (lib.mkIf config.hm.settings.cli.enable {
      programs.gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
      };
    })
  ];
}
