_: {
  wayland.windowManager.hyprland.settings.windowrulev2 = let
    anki = "class:(Anki), title:(Statistics|統計|Preferences|設定|Options|オプション)";
  in [
    "workspace 13, class:(vesktop)"
    "workspace 4, class:(steam)"
    "workspace 4, class:(heroic)"
    "workspace 4, class:(org.prismlauncher.PrismLauncher)"
    "workspace 4, class:(teams-for-linux)"

    "center 1, ${anki}"
    "size 70% 80%, ${anki}"
    "float, ${anki}"

    # special workspaces
    "float, class:(qalculate-gtk)"
    "workspace special:calculator, class:(qalculate-gtk)"
  ];
}
