{lib, ...}: {
  # https://wiki.factorio.com/Application_directory
  home.file.".factorio/config/config.ini.home" = {
    onChange = ''
      rm -f $HOME/.factorio/config/config.ini
      cp $HOME/.factorio/config/config.ini.home $HOME/.factorio/config/config.ini
      chmod u+w $HOME/.factorio/config/config.ini
    '';
    text = lib.generators.toINI {} {
      path = {
        read-data = "__PATH__system-read-data__";
        write-data = "__PATH__system-write-data__";
      };
      general = {
        locale = "auto";
      };
      other = {
        autosave-interval = 1;
        autosave-slots = 6;
        non-blocking-saving = true;
        enable-blueprint-storage-cloud-sync = true;
        technology-gui-pauses-game = false;
      };
      interface = {
        # Options: automatic, manual-pixels, manual-display-points;
        ui-scale-mode = "manual-pixels";
        active-quick-bars = 4;
        shortcut-bar-rows = 2;
        pick-ghost-cursor = true;
        show-tips-and-tricks-notifications = false;
        flat-character-gui = false;
        enable-recipe-notifications = false;
        show-inserter-arrows-when-detailed-info-is-on = true;
        show-combinator-settings-when-detailed-info-is-on = true;
        show-beacon-modules-in-alt-mode = true;
      };
      controls = {
        pipette = "mouse-button-3";
        show-info = "";
        rotate-active-quick-bars = "";
      };
      sound = {
        master-volume = 0.06;
        music-volume = 1;
        game-effects-volume = 1;
        weapons-volume = 0.8;
        explosions-volume = 0.65;
        enemies-volume = 0.7;
        gui-effects-volume = 1;
        walking-sound-volume = 1;
        environment-sounds-volume = 1;
        alerts-volume = 1;
        world-ambient-volume = 0.9;
        wind-volume = 1;
        simulation-volume = 1;
      };
      map-view = {
        show-logistic-network = false;
        show-electric-network = true;
        show-turret-range = false;
        show-pollution = false;
        show-networkless-logistic-members = false;
        show-train-station-names = true;
        show-player-names = true;
        show-tags = true;
        show-worker-robots = true;
        show-rail-signal-states = true;
        show-recipe-icons = true;
        show-pipelines = true;
        show-non-standard-map-info = true;
      };
      debug = {
        show-fps = "always";
        show-time-usage = "debug";
        hide-mod-guis = "debug";
        show-tile-grid = "never";
        show-transport-line-gaps = "debug";
        allow-increased-zoom = "always";
      };
      graphics = {
        # Options: high, medium;
        graphics-quality = "high";
        full-screen = false;

        brightness = 100;
        contrast = 50;
        saturation = 120;

        show-smoke = true;
        show-clouds = false;
        show-fog = true;
        show-space-dust = true;
        show-decoratives = true;
        show-particles = true;
        show-item-shadows = true;
        show-inserter-shadows = true;
        show-animated-water = true;
        show-animated-ghosts = true;
        show-tree-distortion = true;
        additional-terrain-effects = true;
        light-occlusion = true;
        high-quality-animations = true;
        high-quality-shadows = true;
        high-quality-terrain = true;

        # Options: all, high, medium, low;
        video-memory-usage = "all";
        # Options: none, high-quality, low-quality;
        texture-compression-level = "none";
        # Options: x11, wayland;
        linux-preferred-video-driver = "wayland";
      };
    };
  };
}
