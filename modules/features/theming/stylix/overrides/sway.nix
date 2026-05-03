{
  flake.modules.nixos.window-manager_sway = {
    config,
    lib,
    ...
  }: let
    cfg = config.stylix.enable or false;
    stx = config.lib.stylix.colors.withHashtag;
  in {
    hm.wayland.windowManager.sway.config = lib.mkIf cfg {
      colors = let
        background = stx.base01;
        focused = background;
        indicator = stx.base0B;
        text = stx.base02;
        unfocused = stx.base00;
        urgent = stx.base08;
      in {
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

      fonts = let
        font = config.stylix.fonts.monospace.name;
      in {
        names = [font];
        style = "Bold";
        size = 11.0;
      };
    };
  };
}
