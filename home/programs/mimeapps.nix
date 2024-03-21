{ lib, config, ... }:

{
	xdg.desktopEntries.nvim = {
    name = "Neovim";
    genericName = "Text Editor";
    icon = "nvim";
    exec = "${lib.getExe config.programs.kitty.package} -e ${lib.getExe config.programs.neovim.package} %f";
	};
	xdg.mimeApps.defaultApplications = {
		"text/*" = [ "nvim.desktop" ];
    "application/x-shellscript" = [ "nvim.desktop" ];
		"application/pdf" = [ "zathura.desktop" ];
		"image/*" = [ "pix.desktop" ];
		"video/*" = [ "mpv.desktop" ];
	};
}
