{
  modulesPath,
  inputs,
  ...
}: {
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
  ];

  services.openssh.enable = true;
  services.upower.enable = true;

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];

  programs.zsh.enable = true;

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

  nixpkgs.hostPlatform = "x86_64-linux";
}
