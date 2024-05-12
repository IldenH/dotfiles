{...}: {
  wayland.windowManager.hyprland.settings.windowrulev2 = [
    "workspace 13, class:(vesktop)"
    "workspace 2, class:(firefox)" # TODO: different workspaces for different profiles

    # Games
    "workspace 4, class:(steam)"
    "workspace 4, class:(heroic)"
    "workspace 4, class:(org.prismlauncher.PrismLauncher)"

    # Anki
    "workspace 3, class:(Anki)"
    "center 1, class:(Anki), title:(Statistics|Preferences|Options)"
    "size 70% 80%, class:(Anki), title:(Statistics|Preferences|Options)"
    "float, class:(Anki), title:(Statistics|Preferences|Options)"

    # special workspaces
    "float, class:(qalculate-gtk)"
    "workspace special:calculator, class:(qalculate-gtk)"
  ];
}
