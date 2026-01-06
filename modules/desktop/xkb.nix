{
  config,
  lib,
  ...
}: {
  options.nixorcism.desktop.xkb = {
    enable = lib.mkEnableOption "xkb configuration";
  };

  config = lib.mkIf config.nixorcism.desktop.xkb.enable {
    services.xserver = {
      xkb.layout = "us, ru";
      xkb.options = "grp:alt_shift_toggle";

      autoRepeatDelay = 300;
      autoRepeatInterval = 35;
    };
  };
}
