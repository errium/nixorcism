{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.nixorcism.desktop.window-managers.sway.enable {
    hm.wayland.windowManager.sway.config = {
      defaultWorkspace = "workspace number 1";
      bars = [];
    };
  };
}
