{
  flake.modules.nixos.window-manager_niri = {
    hm.programs.niri.settings = {
      layer-rules = [
        {
          matches = [{namespace = "^noctalia-backdrop";}];
          place-within-backdrop = true;
        }
      ];

      window-rules = [
        {
          # Block from screen capture
          matches = [
            {app-id = "com.ayugram.desktop";}
            {app-id = "org.keepassxc.KeePassXC";}
          ];
          block-out-from = "screen-capture";
        }
        {
          # Open floating
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
          # Open fullscreen
          matches = [{app-id = "osu!$";}];
          open-fullscreen = true;
        }
        {
          # Open maximized
          matches = [{app-id = "org.inkscape.Inkscape";}];
          open-maximized = true;
        }
        # {
        #   # Rounded corners
        #   geometry-corner-radius = {
        #     top-left = 2.0;
        #     top-right = 2.0;
        #     bottom-left = 2.0;
        #     bottom-right = 2.0;
        #   };
        #   clip-to-geometry = true;
        # }
      ];
    };
  };
}
