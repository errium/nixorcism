{
  config,
  lib,
  ...
}: {
  options.nixorcism.desktop.window-managers = {
    mangowc.enable = lib.mkEnableOption "Enables mangowc";
  };

  config =
    lib.mkIf config.nixorcism.desktop.window-managers.mangowc.enable {
    };
}
