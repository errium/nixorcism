{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.nixorcism.desktop.window-managers.sway.enable {
    hm.wayland.windowManager.sway.config = {
      gaps = {
        inner = 8;
        outer = 16;
      };

      window = {
        border = 3;
        titlebar = false;
      };
    };
  };
}
