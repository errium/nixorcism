{
  flake.modules.nixos.wm_sway = {
    hm.wayland.windowManager.sway.config = {
      gaps = {
        inner = 8;
        outer = 4;
      };

      window = {
        border = 3;
        titlebar = true;
      };

      fonts = {
        names = ["IosevkaTerm Nerd Font"];
        style = "Bold Semi-Condensed";
        size = 11.0;
      };
    };
  };
}
