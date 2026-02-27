{
  flake.modules.nixos.wm_niri = {
    hm.programs.niri.settings.input = {
      keyboard = {
        repeat-delay = 300;
        repeat-rate = 35;
        xkb = {
          layout = "us,ru";
          options = "grp:alt_shift_toggle";
        };
      };

      touchpad = {
        tap = true;
        drag = true;
        drag-lock = true;
        natural-scroll = true;
      };

      mouse = {
        accel-profile = "flat";
        accel-speed = 0.2;
      };

      focus-follows-mouse = {
        enable = true;
        max-scroll-amount = "30%";
      };
    };
  };
}
