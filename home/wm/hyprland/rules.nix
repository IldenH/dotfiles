_: {
  wayland.windowManager.hyprland.settings.windowrule = let
    anki = "match:class Anki, match:title Statistics|統計|Preferences|設定|Options|オプション";
  in [
    "match:class vesktop, workspace 13"
    "match:class steam, workspace 4"
    "match:class heroic, workspace 4"
    "match:class org.prismlauncher.PrismLauncher, workspace 4"
    "match:class teams-for-linux, workspace 4"

    "${anki}, center 1"
    "${anki}, size 70% 80%"
    "${anki}, float 1"

    # special workspaces
    "match:class qalculate-gtk, float 1"
    "match:class qalculate-gtk, workspace special:calculator"
  ];
}
