{
  flake.modules.nixos.wm_sway = {
    hm.wayland.windowManager.sway.config = {
      gaps = {
        inner = 8;
        outer = 4;
      };

      window = {
        border = 2;
        titlebar = true;
      };
    };
  };
}
