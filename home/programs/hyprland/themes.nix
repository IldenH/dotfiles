{ config, pkgs, ... }:

{
	qt = {
		enable = true;
		platformTheme = "gtk";
		style.name = "adwaita-dark";
		style.package = pkgs.adwaita-qt;
	};
	gtk = {
		enable = true;
		# cursorTheme.package =
		# cursorTheme.name =
		theme.package = pkgs.adw-gtk3;
		theme.name = "adw-gtk3";
		iconTheme.package = pkgs.tela-circle-icon-theme;
		iconTheme.name = "tela-circle-icon-theme";
	};
}
