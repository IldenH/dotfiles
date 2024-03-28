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

		# environment.systemPackages = with pkgs.libsForQt5; [
		# 	fcitx5-with-addons
		# 	fcitx5-configtool
		# ];
		#
  	# i18n.inputMethod = {
  	#   enabled = "fcitx5";
  	#   fcitx5.addons = with pkgs; [
  	#     fcitx5-mozc
  	#     fcitx5-gtk
  	#   ];
  	#   fcitx5.waylandFrontend = true;
  	# };
	};
}
