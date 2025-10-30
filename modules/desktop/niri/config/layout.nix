{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.nixorcism.desktop.niri.enable {
    hm = {
      programs.niri.settings.layout = {
        gaps = 12;
        background-color = "transparent";
        center-focused-column = "never";
        always-center-single-column = true;
        default-column-width = {
          proportion = 0.50;
        };

        preset-column-widths = [
          {proportion = 0.33333;}
          {proportion = 0.50;}
          {proportion = 0.66667;}
        ];

        preset-window-heights = [
          {proportion = 0.33333;}
          {proportion = 0.50;}
          {proportion = 0.66667;}
        ];

        focus-ring = {
          width = 3;
          active.color = "#3ddbd9";
          inactive.color = "#262626";
        };

        # border = {
        #   width = 3;
        #   active.color = "#3ddbd9";
        #   inactive.color = "#262626";
        #   urgent.color = "#ee5396";
        # };

        tab-indicator = {
          width = 6;
          gap = 12;
          length.total-proportion = 0.50;
          position = "left";
          place-within-column = true;
        };

        shadow = {
          draw-behind-window = true;
          softness = 30;
          spread = 5;
          offset = {
            x = 0;
            y = 5;
          };
          color = "#0007";
        };

        # Outer gap, <values-below> + gaps
        # struts = {
        #   left = 8;
        #   right = 8;
        #   top = 8;
        #   bottom = 8;
        # };
      };
    };
  };
}
