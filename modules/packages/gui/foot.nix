{
  config,
  lib,
  ...
}: {
  options.nixorcism.packages.gui.foot = {
    enable = lib.mkEnableOption "Whether to enable foot terminal";
  };

  config = lib.mkIf config.nixorcism.packages.gui.foot.enable {
    hm.programs.foot = {
      enable = true;

      # NOTE
      # Seems to be broken, 05-01-26
      # server.enable = true;

      settings = {
        cursor = {
          blink = "yes";
          blink-rate = 1000;
          style = "beam";
        };
        mouse.hide-when-typing = "yes";
      };
    };
  };
}
