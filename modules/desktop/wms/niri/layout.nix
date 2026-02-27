{
  flake.modules.nixos.wm_niri = {
    hm.programs.niri.settings.layout = {
      always-center-single-column = true;
      background-color = "transparent";
      center-focused-column = "never";
      default-column-width = {proportion = 0.50;};
      gaps = 8;

      preset-column-widths = [
        {proportion = 0.25;}
        {proportion = 0.50;}
        {proportion = 0.75;}

        # {proportion = 0.33333;}
        # {proportion = 0.50;}
        # {proportion = 0.66667;}
      ];

      focus-ring = {
        enable = true;
        width = 3;
      };

      border = {
        enable = true;
        width = 3;
      };

      shadow = {
        enable = false;
        color = "#0007";
        draw-behind-window = true;
        softness = 30;
        spread = 5;
        offset = {
          x = 0;
          y = 5;
        };
      };

      tab-indicator = {
        width = 6;
        gap = 8;
        corner-radius = 12;
        length.total-proportion = 0.40;
        place-within-column = true;
        position = "left";
      };

      struts = {
        left = 8;
        right = 8;
        top = 8;
        bottom = 8;
      };
    };
  };
}
