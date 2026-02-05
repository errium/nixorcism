{
  config,
  lib,
  ...
}: let
  stx = config.lib.stylix.colors.withHashtag;

  background = stx.base01;
  indicator = stx.base03;
  text = stx.base05;
  urgent = stx.base08;
  focused = stx.base02;
  unfocused = stx.base01;
in {
  config = lib.mkIf (config.nixorcism.desktop.window-managers.sway.enable && config.stylix.enable) {
    hm.wayland.windowManager.sway.config.colors = {
      inherit background;

      urgent = {
        inherit background indicator text;
        border = urgent;
        childBorder = urgent;
      };

      focused = {
        inherit background indicator text;
        border = focused;
        childBorder = focused;
      };

      focusedInactive = {
        inherit background indicator text;
        border = unfocused;
        childBorder = unfocused;
      };

      unfocused = {
        inherit background indicator;
        text = stx.base03; 
        border = unfocused;
        childBorder = unfocused;
      };

      placeholder = {
        inherit background indicator text;
        border = unfocused;
        childBorder = unfocused;
      };
    };
  };
}
