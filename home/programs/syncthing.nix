{osConfig, ...}: let
  syncthingFolders = builtins.attrNames osConfig.services.syncthing.settings.folders;
  folders =
    builtins.map (
      path:
        builtins.replaceStrings ["~/"] [""] path
    )
    syncthingFolders;
in {
  home.file = builtins.listToAttrs (builtins.map (path: {
      name = "${path}/.stignore";
      value.text = "#include .stglobalignore";
    })
    folders);
}
