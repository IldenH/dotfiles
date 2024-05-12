{
  lib,
  config,
  pkgs,
  ...
}: {
  options.settings.files.enable = lib.mkEnableOption "files";

  config = lib.mkIf (config.settings.files.enable) {
    home.packages = with pkgs; [
      (cinnamon.nemo-with-extensions.override {
        extensions = with cinnamon; [
          nemo-fileroller # archives
        ];
      })
    ];

    dconf.settings = {
      "org/cinnamon/desktop/default-applications/terminal" = {
        exec = "kitty";
      };
      "org/nemo/desktop" = {
        show-desktop-icons = false;
      };
      # General config
      "org/nemo/preferences" = {
        date-font-choice = "auto-mono";
        default-folder-viewer = "icon-view";
        "inherit-folder-viewer" = true;
        ignore-view-metadata = true;
        click-policy = "single";
        quick-renames-with-pause-in-between = false; # double-click name to rename
        click-double-parent-folder = true; # double-click empty space
        never-queue-file-ops = false;
        start-with-dual-pane = false;
        confirm-trash = true;
        enable-delete = true;
        date-format = "iso";
        show-full-path-titles = true;
        show-image-thumbnails = "local-only";

        show-compact-view-icon-toolbar = false;
        show-computer-icon-toolbar = false;
        show-edit-icon-toolbar = false;
        show-home-icon-toolbar = false;
        show-icon-view-icon-toolbar = false;
        show-list-view-icon-toolbar = false;
        show-new-folder-icon-toolbar = false;
        show-next-icon-toolbar = true;
        show-open-in-terminal-toolbar = false;
        show-previous-icon-toolbar = true;
        show-reload-icon-toolbar = true;
        show-search-icon-toolbar = true;
        show-show-thumbnails-toolbar = false;
        show-up-icon-toolbar = true;
      };
      # Context menus:
      "org/nemo/preferences/menu-config" = {
        background-menu-create-new-folder = true;
        background-menu-open-as-root = true;
        background-menu-open-in-terminal = false;
        background-menu-paste = true;
        background-menu-properties = true;
        background-menu-scripts = true;
        background-menu-show-hidden-files = false;

        desktop-menu-customize = true;

        iconview-menu-arrange-items = true;
        iconview-menu-organize-by-name = true;

        selection-menu-copy = true;
        selection-menu-copy-to = false;
        selection-menu-cut = true;
        selection-menu-duplicate = true;
        selection-manu-favorite = false;
        selection-menu-make-link = false;
        selection-menu-move-to = false;
        selection-menu-move-to-trash = true;
        selection-menu-open = true;
        selection-menu-open-as-root = true;
        selection-menu-open-in-new-tab = true;
        selection-menu-open-in-new-window = true;
        selection-menu-open-in-terminal = false;
        selection-menu-paste = true;
        selection-menu-pin = false;
        selection-menu-properties = true;
        selection-menu-rename = true;
        selection-menu-scripts = true;
      };
    };
  };
}
