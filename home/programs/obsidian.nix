{
  pkgs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.settings.other.enable {
    home.packages = [pkgs.obsidian];

    home.file.".config/obsidian/obsidian.json".text = builtins.toJSON {
      vaults.vault = {
        path = "${config.home.homeDirectory}/Vault";
        open = true;
      };
      frame = "hidden";
      disableGpu = true;
    };
  };
}
