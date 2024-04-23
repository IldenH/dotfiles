{ config, pkgs, lib, ... }:

{
	options.settings.japanese.enable = lib.mkEnableOption "japanese";

	config = lib.mkIf (config.settings.japanese.enable) {
		fonts.packages = with pkgs; [
  	  carlito
  	  dejavu_fonts
  	  ipafont
  	  kochi-substitute
  	  source-code-pro
  	  ttf_bitstream_vera
  	];

  	fonts.fontconfig.defaultFonts = {
  	  monospace = [
  	    "DejaVu Sans Mono"
  	    "IPAGothic"
  	  ];
  	  sansSerif = [
  	    "DejaVu Sans"
  	    "IPAPGothic"
  	  ];
  	  serif = [
  	    "DejaVu Serif"
  	    "IPAPMincho"
  	  ];
  	};

  	i18n.inputMethod = {
  	  enabled = "fcitx5";
  	  fcitx5.addons = with pkgs; [
  	    fcitx5-mozc
  	    fcitx5-gtk
  	  ];
  	  fcitx5.waylandFrontend = true;
			# this doesn't work, TODO: just do it using home-manager and home.file
			# fcitx5.settings = {
			# 	globalOptions = {
			# 		"Hotkey/TriggerKeys.0" = "Alt+Shift+Z";
			# 		"Behavior.ActiveByDefault" = "True";
			# 		"Behavior.ShareInputState" = "All";
			# 	};
			# 	addons = {
			# 		"classicui.TrayOutlineColor" = "#282828"; # if this was home-manager then nix-colors
			# 		"classicui.TrayTextColor" = "#fbf1c7";
			# 		"classicui.Theme" = "default-dark";
			# 	};
			# };
  	};
	};
}
