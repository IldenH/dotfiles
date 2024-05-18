{...}: {
  wayland.windowManager.hyprland.settings.windowrulev2 = [
    # anki
    "center 1, class:(Anki), title:(Statistics|Preferences|Options)"
    "size 70% 80%, class:(Anki), title:(Statistics|Preferences|Options)"
    "float, class:(Anki), title:(Statistics|Preferences|Options)"

    # special workspaces
    "float, class:(qalculate-gtk)"
    "workspace special:calculator, class:(qalculate-gtk)"
  ];
}
