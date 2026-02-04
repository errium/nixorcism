{
  config,
  lib,
  ...
}: let
  stx = config.lib.stylix.colors.withHashtag;

  background = stx.base00;
  indicator = stx.base0E;
  text = stx.base05;
  urgent = stx.base08;
  focused = stx.base05;
  unfocused = stx.base02;
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
        inherit background indicator text;
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
