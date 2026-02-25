{
  flake.modules.nixos.wm_sway = {
    config,
    lib,
    ...
  }: let
    cfg = (config.stylix.enable or false);
    stx = config.lib.stylix.colors.withHashtag;

    background = stx.base01;
    indicator = stx.base0C;
    text = stx.base05;
    urgent = stx.base08;
    focused = stx.base03;
    unfocused = stx.base01;
  in {
    hm.wayland.windowManager.sway.config = lib.mkIf cfg {
      colors = {
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

      fonts = {
        names = [config.stylix.fonts.monospace.name];
        style = "SemiBold";
        size = 11.0;
      };
    };
  };
}
