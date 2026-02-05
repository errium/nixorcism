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
    hm = {
      imports = [inputs.dms.homeModules.dank-material-shell];

      programs.dank-material-shell = {
        enable = true;

        systemd = {
          enable = true; 
          restartIfChanged = true; 
        };
      };
    };
  };
}
