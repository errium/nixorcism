{
  config,
  lib,
  ...
}: {
  options.nixorcism.desktop = {
    ly.enable = lib.mkEnableOption "Enables ly";
  };

  config = lib.mkIf config.nixorcism.desktop.ly.enable {
    services.displayManager.ly = {
      enable = true;

      settings = {
        bigclock = "en";
        allow_empty_password = true;
        auth_fails = 5;
        clear_password = true;
      };
    };
  };
}
