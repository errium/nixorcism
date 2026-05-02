{
  flake.modules.nixos.window-manager_sway = {
    hm.wayland.windowManager.sway.config = {
      gaps = {
        inner = 8;
        outer = 6;
      };

      window = {
        border = 3;
        titlebar = false;
      };
    };
  };
}
