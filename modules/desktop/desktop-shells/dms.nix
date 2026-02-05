{
  config,
  lib,
  ...
}: {
  options.nixorcism.desktop.desktop-shells.dms = {
    enable = lib.mkEnableOption "DankMaterialShell";
  };

  config = lib.mkIf config.nixorcism.desktop.desktop-shells.dms.enable {
    programs.dms-shell = {
      enable = true;

      systemd = {
        enable = true;
        restartIfChanged = true;
      };
    };
  };
}
