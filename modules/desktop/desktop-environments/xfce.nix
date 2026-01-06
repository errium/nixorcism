{
  config,
  lib,
  ...
}: {
  options.nixorcism.desktop.desktop-environments.xfce = {
    enable = lib.mkEnableOption "XFCE";
  };

  config = lib.mkIf config.nixorcism.desktop.desktop-environments.xfce.enable {
    services.xserver = {
      enable = true;
      desktopManager.xfce.enable = true;
    };
  };
}
