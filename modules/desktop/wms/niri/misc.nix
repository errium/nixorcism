{
  flake.modules.nixos.wm_niri = {
    hm.programs.niri.settings = {
      prefer-no-csd = true;
      hotkey-overlay.skip-at-startup = true;
      screenshot-path = "~/Pictures/Screenshots/%d-%m_%H-%M.png";
      gestures.hot-corners.enable = false;

      environment = {
        NIXOS_OZONE_WL = "1";
        QT_QPA_PLATFORM = "wayland";
      };

      spawn-at-startup = [
        {sh = "foot --server &";}
      ];

      workspaces = {
        "1" = {};
        "2" = {};
        "3" = {};
        "4" = {};
        "5" = {};
        "6" = {};
        "7" = {};
        "8" = {};
        "9" = {};
        "10" = {};
      };
    };
  };
}
