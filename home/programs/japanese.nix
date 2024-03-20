{ pkgs, ... }:

{
	home.packages = with pkgs.libsForQt5; [
		fcitx5-with-addons
		fcitx5-configtool
	];

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
    ];
  };
}
