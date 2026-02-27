{
  flake.modules.nixos.wm_niri = {
    hm.programs.niri.settings = {
      layer-rules = [
        {
          matches = [{namespace = "^noctalia-overview*";}];
          place-within-backdrop = true;
        }
      ];

      window-rules = [
        {
          matches = [
            {app-id = "Bitwarden";}
            {app-id = "org.telegram.desktop";}
          ];
          block-out-from = "screen-capture";
        }

        {
          matches = [
            {
              app-id = "firefox$";
              title = "^Picture-in-Picture$";
            }
            {app-id = "org.gnome.NautilusPreviewer";}
          ];
          open-floating = true;
        }

        {
          matches = [{app-id = "osu!$";}];
          open-fullscreen = true;
        }

        {
          matches = [{app-id = "org.inkscape.Inkscape";}];
          open-maximized = true;
        }

        {
          geometry-corner-radius = {
            top-left = 2.0;
            top-right = 2.0;
            bottom-left = 2.0;
            bottom-right = 2.0;
          };
          clip-to-geometry = true;
        }
      ];
    };
  };
}
