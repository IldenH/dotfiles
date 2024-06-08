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

    programs.scmpuff.enable = true;

    home.shellAliases = {
      gs = "scmpuff_status";
      ga = "git add";
      gaa = "git add -A";
      gc = "git commit";
      gca = "git commit --amend";
      gp = "git push";
      gpu = "git pull";
      gd = "git diff";
      gds = "git diff --staged";
      gl = "git log";
      gw = "git whatchanged";
      gr = "git restore";
      grs = "git restore --staged";
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
  };
}
