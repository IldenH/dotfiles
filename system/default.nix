{
  lib,
  pkgs,
  config,
  global,
  inputs,
  ...
}: {
  imports = [
    ./browser.nix
    ./console.nix
    ./grub.nix
    ./hyprland.nix
    ./japanese.nix
    ./locale.nix
    ./networking.nix
    ./nvidia.nix
    ./sddm
    ./steam.nix
    ./user.nix
  ];

  options.settings = {
    utils.enable = lib.mkEnableOption "utils" // {default = true;};
    sound.enable = lib.mkEnableOption "sound";
    shell = lib.mkOption {
      type = lib.types.package;
      default = pkgs.zsh;
    };
  };

  config = lib.mkMerge [
    (lib.mkIf (config.settings.utils.enable) {
      nix.settings.experimental-features = ["nix-command" "flakes"];
      nixpkgs.config.allowUnfree = true;

      services = {
        printing.enable = true;
        fstrim.enable = true;
      };

      programs = {
        zsh.enable = true;
        dconf.enable = true;
        nano.enable = false;
      };

      programs.nh = {
        enable = true;
        package = inputs.nh.packages.${pkgs.system}.nh;
        flake = "/home/${global.user.name}/dotfiles";
        clean.enable = true;
        clean.extraArgs = "--keep-since 4d --keep 5 --nogcroots";
      };

      environment.shells = [config.settings.shell];

      environment.systemPackages = with pkgs; [
        curl
        wget
      ];
    })
    (lib.mkIf (config.settings.sound.enable) {
      sound.enable = true;
      hardware.pulseaudio.enable = false;
      security.rtkit.enable = true;
      services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        # jack.enable = true;
        # media-session.enable = true;
      };
    })
  ];
}
