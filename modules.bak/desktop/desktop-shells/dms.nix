{
  config,
  inputs,
  lib,
  ...
}: {
  options.nixorcism.desktop.desktop-shells.dms = {
    enable = lib.mkEnableOption "DankMaterialShell";
  };

  config = lib.mkIf config.nixorcism.desktop.desktop-shells.dms.enable {
    services.upower.enable = true;

    hm = {
      imports = [inputs.dms.homeModules.dank-material-shell];

      programs.dank-material-shell = {
        enable = true;

        systemd = {
          enable = true; 
          restartIfChanged = true; 
        };

        enableCalendarEvents = false;
        enableDynamicTheming = false;
        enableVPN = false;
      };
    };
  };
}
