{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.nixorcism.desktop.niri.enable {
    hm = {
      programs.niri.settings.window-rules = let
        radius = 0;
      in [
        {
          matches = [];
          geometry-corner-radius = {
            top-left = radius;
            top-right = radius;
            bottom-left = radius;
            bottom-right = radius;
          };
          clip-to-geometry = true;
          draw-border-with-background = false;
        }
        {
          matches = [
            {
              app-id = "firefox";
              title = "Picture in Picture";
            }
          ];
          open-floating = true;
        }
        {
          matches = [
            {
              app-id = "^org\.keepassxc\.KeePassXC$";
            }
            {
              app-id = "^org\.gnome\.World\.Secrets$";
            }
          ];
          block-out-from = "screen-capture";
        }
      ];
    };
  };
}
