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
		# cursorTheme.name is problably wrong, doesn't work
		# cursorTheme.package = pkgs.catppuccin-cursors.macchiatoDark;
		# cursorTheme.name = "catppuccin-cursors";
		theme.package = nix-colors-lib.gtkThemeFromScheme {
			scheme = config.colorScheme;
		};
		theme.name = "${config.colorScheme.slug}";
		iconTheme.package = pkgs.tela-circle-icon-theme;
		iconTheme.name = "Tela-circle";
	};
}
