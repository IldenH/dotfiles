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
		cursorTheme.package = pkgs.catppuccin-cursors.macchiatoDark;
		cursorTheme.name = "Catppuccin-Macchiato-Dark-Cursors";
		theme.package = nix-colors-lib.gtkThemeFromScheme {
			scheme = config.colorScheme;
		};
		theme.name = "${config.colorScheme.slug}";
		iconTheme.package = pkgs.tela-circle-icon-theme;
		iconTheme.name = "Tela-circle";
	};
	home.pointerCursor = {
		package = pkgs.catppuccin-cursors.macchiatoDark;
		name = "Catppuccin-Macchiato-Dark-Cursors";
		size = 24;
	};
}
