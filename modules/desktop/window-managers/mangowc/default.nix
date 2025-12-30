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
  };
}
