{
  config,
  lib,
  secrets,
  pkgs,
  ...
}: {
  config = lib.mkIf config.settings.cli.enable {
    programs.git = {
      enable = true;
      userName = "IldenH";
      userEmail = secrets.email;
      extraConfig = {
        init.defaultBranch = "main";
        commit.gpgSign = true;
        gpg.program = "${lib.getExe config.programs.gpg.package}";
        user.signingKey = secrets.gpg.id;
      };
      ignores = [".direnv"];
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

    programs.gh = {
      enable = true;
      settings.git_protocol = "ssh";
    };
  };
}
