{ config, pkgs, inputs, lib, ... }:

{
	config = let
		format = "%Y-%m-%d_%H-%M-%S.png";
		args = "--notify --freeze";
		path = "$HOME/Pictures/Screenshots/Raw/$(date +\"${format}\")";
	in
	{
		home.packages = with pkgs; [
			grim
			slurp
			grimblast
			swappy
			wl-clipboard
		];

		# Configure swappy (screenshot annotation tool)
		home.file.".config/swappy/config".text = ''
		[Default]
		save_dir=$HOME/Pictures/Screenshots/Edited
		save_filename_format=${format}
		show_panel=true
		# early_exit=true # Exit on export
		'';

		# Configure keybindings
		wayland.windowManager.hyprland.settings = {
			bind = [
				"ALT SHIFT, E, exec, wl-paste | swappy -f -"
				"ALT SHIFT, S, exec, grimblast ${args} copysave area ${path}"
				# "$mainMod, S, exec, grimblast ${args} copysave active ${path}"
				"$mainMod ALT, S, exec, grimblast ${args} copysave output ${path}"
				"$mainMod SHIFT, S, exec, grimblast ${args} copysave screen ${path}"
			];
		};
	};
}
