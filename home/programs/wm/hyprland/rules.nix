{ ... }:

{
	wayland.windowManager.hyprland.settings.windowrulev2 = [
		"workspace 13, class:(vesktop)"
		"workspace 4, class:(steam)"
		"workspace 4, class:(heroic)"
		"workspace 2, class:(firefox)" # TODO: different workspaces for different profiles

		# Anki
		"workspace 3, class:(Anki)"
		"center 1, class:(Anki), title:(Statistics|Preferences)"
		"float, class:(Anki), title:(Statistics|Preferences)"

		# special workspaces
    "float, class:(qalculate-gtk)"
    "workspace special:calculator, class:(qalculate-gtk)"
	];
}
