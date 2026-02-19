{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.nixorcism.desktop.window-managers.sway.enable {
    hm.wayland.windowManager.sway.config = {
      input = {
        "type:keyboard" = {
          repeat_delay = "300";
          repeat_rate = "35";
          xkb_layout = "us,ru";
          xkb_options = "grp:alt_shift_toggle";
        };

        "type:touchpad" = {
          tap = "enabled";
          drag = "enabled";
          drag_lock = "enabled";
          natural_scroll = "enabled";
        };

        "type:pointer" = {
          accel_profile = "flat";
          pointer_accel = "0.2";
        };
      };

      focus.followMouse = "yes";
    };
  };
}
