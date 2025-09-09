{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../system
  ];

  # boot.kernelPackages = pkgs.linuxPackages_latest;
  services = {
    openssh.enable = true;
    openssh.startWhenNeeded = true;
    syncthing.enable = true;
    printing.enable = true;
    logind.extraConfig = ''
      HandlePowerKey=ignore
      HandleLidSwitch=suspend
      HandleLidSwitchDocked=suspend
    '';
  };

  boot.loader.grub.enable = lib.mkForce false;
  boot.loader.systemd-boot.enable = true;

  boot.kernelParams = ["amd_pstate=active"];
  environment.variables.LIBSEAT_BACKEND = "logind";

  virtualisation.docker.enable = true;
  virtualisation.docker.enableOnBoot = false;

  networking.hostId = "32bb9655";
  boot.zfs.devNodes = "/dev/disk/by-partuuid";

  settings = {
    keyMap = "no";

    networking = {
      enable = true;
      bluetooth.enable = false;
    };

    graphics.enable = true;

    japanese.enable = true;
    sound.enable = true;
    utils.enable = true;

    zfs.enable = true;
    zfs.encryption = true;
    zfs.snapshots = true;
    impermanence.enable = true;
  };

  services.tlp = {
    enable = true;
    settings = {
      START_CHARGE_THRESH_BAT0 = 75;
      STOP_CHARGE_THRESH_BAT0 = 80;
      RESTORE_THRESHOLDS_ON_BAT = 1;

      RADEON_DPM_PERF_LEVEL_ON_AC = "high";
      RADEON_DPM_PERF_LEVEL_ON_BAT = "low";

      RADEON_DPM_STATE_ON_AC = "performance";
      RADEON_DPM_STATE_ON_BAT = "battery";

      RADEON_POWER_PROFILE_ON_AC = "high";
      RADEON_POWER_PROFILE_ON_BAT = "low";

      PCIE_ASPM_ON_AC = "performance";
      PCIE_ASPM_ON_BAT = "powersupersave";

      CPU_ENERGY_PERF_POLICY_ON_AC = "balance_power";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      PLATFORM_PROFILE_ON_AC = "performance";
      PLATFORM_PROFILE_ON_BAT = "low-power";
      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;
      CPU_HWP_DYN_BOOST_ON_AC = 1;
      CPU_HWP_DYN_BOOST_ON_BAT = 0;
      RUNTIME_PM_ON_AC = "auto";
      RUNTIME_PM_ON_BAT = "auto";

      USB_AUTOSUSPEND = 1;
      USB_EXCLUDE_AUDIO = 1;
      WOL_DISABLE = "Y";
      WIFI_PWR_ON_AC = "on";
      WIFI_PWR_ON_BAT = "on";
      DEVICES_TO_DISABLE_ON_LAN_CONNECT = "wifi";
      DEVICES_TO_ENABLE_ON_LAN_DISCONNECT = "wifi";

      DEVICES_TO_DISABLE_ON_STARTUP = "nfc wwan";
      DEVICES_TO_ENABLE_ON_STARTUP = "bluetooth wifi";
      DEVICES_TO_DISABLE_ON_SHUTDOWN = "nfc wifi wwan";
      DEVICES_TO_DISABLE_ON_BAT_NOT_IN_USE = "nfc wwan";
    };
  };

  system.stateVersion = "24.11";
}
