{ config, pkgs, inputs, lib, ... }:

let
	nix-colors-lib = inputs.nix-colors.lib.contrib { inherit pkgs; };
in
{
	qt = {
		enable = true;
		platformTheme = "gtk";
		style.name = "adwaita-dark";
		style.package = pkgs.adwaita-qt;
	};
	gtk = {
		enable = true;
		cursorTheme.package = pkgs.graphite-cursors;
		cursorTheme.name = "graphite-cursors";
		# theme.package = pkgs.adw-gtk3;
		# theme.name = "adw-gtk3";
		theme.package = nix-colors-lib.gtkThemeFromScheme {
			scheme = config.colorScheme;
		};
		theme.name = "${config.colorScheme.slug}";
		iconTheme.package = pkgs.tela-circle-icon-theme;
		iconTheme.name = "tela-circle-icon-theme";
	};
}
