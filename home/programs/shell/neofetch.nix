{
  lib,
  config,
  pkgs,
  global,
  ...
}: {
  config = lib.mkIf (config.settings.terminal.cli.enable) {
    home.packages = [pkgs.neofetch];
    programs.zsh.initExtra = ''neofetch'';

    home.file.".config/neofetch/config.conf".text = ''
      print_info() {
      	prin "$(color 5)- ~ Hello $(color 1)${global.user.description} ~ -"
      	prin ""

      	  info "You are using" distro
      	info "With" kernel
      	  info "On" model
      	prin ""
      	  info "Uptime " uptime
      	info "Memory " memory
      	  info "Packages" packages
      	prin ""
      	  info "WM Theme" wm_theme
      	  info "Theme" theme
      	  info "Icons" icons
      	prin ""
      	  info "CPU" cpu
      	  info "GPU" gpu

      	  info underline
      	prin ""
      	output=""
      	for i in {0..7}; do
      		output="$output$(color $i)# "
      	done
      	prin "$output"
      }

      kernel_shorthand="on"
      os_arch="off"
      uptime_shorthand="on"
      memory_unit="gib"
      package_managers="on"

      speed_shorthand="on"
      cpu_brand="off"
      cpu_temp="C"

      gpu_brand="off"
      gpu_type="dedicated"

      underline_char="-"
      separator=":"

      # Each number represents a different part of the text in
      # this order: 'title', '@', 'underline', 'subtitle', 'colon', 'info'
      colors=(1 1 3 4 5 6)
      ascii_colors=(distro)
    '';
  };
}
