{
  flake.modules.nixos.wm-utils_dank-material-shell = {
    programs.dms-shell = {
      enable = true;

      enableAudioWavelength = false;
      enableCalendarEvents = false;
      enableDynamicTheming = false;
      enableVPN = false;

      systemd = {
        enable = true;
        restartIfChanged = true;
      };
    };

    services.power-profiles-daemon.enable = false;
  };
}
