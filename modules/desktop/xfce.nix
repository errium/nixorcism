{
  config,
  lib,
  ...
}: {
  options.nixorcism.desktop = {
    xfce.enable = lib.mkEnableOption "Enables xfce";
  };

  config = lib.mkIf config.nixorcism.desktop.xfce.enable {
    services.xserver = {
      enable = true;
      desktopManager.xfce.enable = true;
    };
  };
}
