{
  config,
  lib,
  ...
}: {
  options.nixorcism.services.udiskie = {
    enable = lib.mkEnableOption "udiskie";
  };

  config = lib.mkIf config.nixorcism.services.udiskie.enable {
    services.udisks2 = {
      enable = true;
    };

    hm.services.udiskie = {
      enable = true;
      automount = true;
      notify = true;
      tray = "never";
    };
  };
}
