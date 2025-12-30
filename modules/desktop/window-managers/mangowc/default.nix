{
  config,
  inputs,
  lib,
  ...
}: {
  imports = [
    inputs.mango.nixosModules.mango
  ];

  options.nixorcism.desktop.window-managers = {
    mangowc.enable = lib.mkEnableOption "Enables mangowc";
  };

  config = lib.mkIf config.nixorcism.desktop.window-managers.mangowc.enable {
    programs.mango.enable = true;

    hm.home.file.".config/mango/config.conf".source =
      config.lib.file.mkOutOfStoreSymlink /home/errium/nixorcism/modules/desktop/window-managers/mangowc/config.conf;
  };
}
