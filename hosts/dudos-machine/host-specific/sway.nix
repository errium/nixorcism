{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.nixorcism.desktop.window-managers.sway.enable {
    hm.wayland.windowManager.sway.config = {
      output = {
        "BOE 0x0B38 0x00000003" = {
          mode = ''2560x1600@165.002Hz'';
          adaptive_sync = "on";
        };
      };
    };
  };
}
