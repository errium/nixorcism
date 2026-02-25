{
  flake.modules.nixos.wm_sway = {
    config,
    lib,
    ...
  }: let
    cfg = config.stylix.enable or false;
    stx = config.lib.stylix.colors.withHashtag;

    background = stx.base01;
    focused = background;
    indicator = stx.base0B;
    text = stx.base02;
    unfocused = stx.base00;
    urgent = stx.base08;
  in {
    hm.wayland.windowManager.sway.config = lib.mkIf cfg {
      colors = {
        inherit background;
        urgent = {
          inherit indicator;
          background = urgent;
          border = urgent;
          childBorder = urgent;
          text = stx.base00;
        };
        focused = {
          inherit background indicator text;
          border = focused;
          childBorder = focused;
        };
        focusedInactive = {
          inherit indicator text;
          background = unfocused;
          border = unfocused;
          childBorder = unfocused;
        };
        unfocused = {
          inherit indicator;
          background = unfocused;
          border = unfocused;
          childBorder = unfocused;
          text = stx.base01;
        };
        placeholder = {
          inherit indicator;
          background = unfocused;
          border = unfocused;
          childBorder = unfocused;
          text = stx.base01;
        };
      };

      fonts = {
        names = [config.stylix.fonts.monospace.name];
        style = "Bold";
        size = 11.0;
      };
    };
  };
}
