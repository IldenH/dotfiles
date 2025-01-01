{
  modulesPath,
  inputs,
  pkgs,
  lib,
  secrets,
  ...
}: {
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
  ];

  services.openssh.enable = true;
  services.upower.enable = true;

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];

  networking.networkmanager.enable = true;
  networking.wireless.enable = lib.mkForce false;
  users.users.nixos.extraGroups = ["networkmanager"];

  programs.git = {
    enable = true;
    config = {
      user.name = "IldenH";
      user.email = secrets.email;
      commit.gpgSign = true;
      user.signingKey = secrets.gpg.id;
    };
  };
  programs.neovim.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryPackage = pkgs.pinentry-tty;
  };

  environment.systemPackages = with pkgs; [
    fzf
    jq
    git-crypt
  ];

  console = {
    keyMap = "no";
    colors = with inputs.nix-colors.colorSchemes.gruvbox-dark-medium.palette; [
      "${base00}" # black
      "${base08}" # red
      "${base0B}" # green
      "${base0A}" # yellow
      "${base0D}" # blue
      "${base0E}" # magenta
      "${base0C}" # cyan
      "${base05}" # gray
      "${base03}" # darkgray
      "${base08}" # lightred
      "${base0B}" # lightgreen
      "${base0A}" # lightyellow
      "${base0D}" # lightblue
      "${base0E}" # lightmagenta
      "${base0C}" # lightcyan
      "${base06}" # white
    ];
  };

  environment.etc."installer/id_ed25519.pub".text = secrets.ssh.installer.public;
  environment.etc."installer/id_ed25519".text = secrets.ssh.installer.private;
  environment.etc."installer/gpg-key.asc".source = ../../secrets/gpg-key.asc;
  environment.etc."installer/install.sh".source = ./install.sh;
  system.activationScripts.setupInstallerEnvironment = ''
    mkdir -p /home/nixos/.ssh
    ln -sf /etc/installer/id_ed25519.pub /home/nixos/.ssh/id_ed25519.pub
    ln -sf /etc/installer/id_ed25519 /home/nixos/.ssh/id_ed25519

    ln -sf /etc/installer/install.sh /home/nixos/install.sh
    chmod +x /home/nixos/install.sh
  '';

  nixpkgs.hostPlatform = "x86_64-linux";
}
