{
  config,
  lib,
  secrets,
  pkgs,
  ...
}: {
  config = lib.mkIf (config.settings.terminal.cli.enable) {
    programs.git = {
      enable = true;
      userName = "IldenH";
      userEmail = "IldenH.1" + "@" + "proton.me";
      extraConfig = {
        init.defaultBranch = "main";
        commit.gpgsign = true;
        gpg.program = "${lib.getExe config.programs.gpg.package}";
        user.signingKey = secrets.gpg.id;
      };
    };

    home.packages = [pkgs.git-crypt];

    programs.gpg = {
      enable = true;
      publicKeys = [
        {
          text = secrets.gpg.public;
          trust = "ultimate";
        }
      ];
    };

    services.gpg-agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-qt;
    };
  };
}
