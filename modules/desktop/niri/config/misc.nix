{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.nixorcism.desktop.niri.enable {
    hm = {
      programs.niri.settings = {
        prefer-no-csd = true;
        hotkey-overlay.skip-at-startup = true;
        screenshot-path = "~/Pictures/niriScreenshots/%H:%M %d-%m.png";

        # Environment variables
        environment = {
          NIXOS_OZONE_WL = "1";
          QT_QPA_PLATFORM = "wayland";
          XCURSOR_SIZE = "16";
        };

        # Render with iGPU only
        # debug = {
        #   ignore-drm-device = "/dev/dri/renderD128";
        #   render-drm-device = "/dev/dri/renderD129";
        # };

        # Wallpaper in overview
        layer-rule = {
          match = {
            namespace = "^wallpaper$";
          };
          place-within-backdrop = true;
        };

        # Disable hot corners
        gestures = {
          hot-corners = {
            off = true;
          };
        };
      };
    };
  };
}
