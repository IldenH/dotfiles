{
  global,
  inputs,
  ...
}: {
  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence
  ];

  home.persistence."/persistent/home/${global.user.name}" = {
    directories = [
      "Downloads"
      "Music"
      "Pictures"
      "Documents"
      "Videos"

      "dev"
      "dotfiles"
      "nixvim"

      ".gnupg"
      ".ssh"

      ".mozilla"
      ".tldrc/tldr/pages"
      ".factorio"
      ".minecraft"
      ".steam"
      ".old"

      # TODO: more specific
      ".local"
      ".config"
    ];
    files = [
      ".zsh_history"
    ];
    # allowOther = true;
  };
}
