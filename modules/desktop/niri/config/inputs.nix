{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.nixorcism.desktop.niri.enable {
    hm = {
      programs.niri.settings.input = {
        keyboard = {
          xkb = {
            layout = "us,ru";
            options = "grp:alt_shift_toggle";
          };
          repeat-delay = 300;
          repeat-rate = 35;
        };

        touchpad = {
          tap = true;
          drag = true;
          drag-lock = true;
          natural-scroll = true;
        };

        mouse = {
          accel-speed = 0.2;
          accel-profile = "flat";
        };

        mod-key = "Super";
        focus-follows-mouse.enable = true;
      };
    };
  };
}
