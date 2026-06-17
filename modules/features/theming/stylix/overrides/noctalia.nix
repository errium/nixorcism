{
  flake.modules.nixos.desktop-extra_noctalia = {
    config,
    lib,
    ...
  }: let
    cfg = config.stylix.enable or false;
    stx = config.lib.stylix.colors.withHashtag;

    primary = stx.base05;
    secondary = stx.base04;
    tertiary = stx.base05;
  in
    lib.mkIf cfg {
      hm.xdg.configFile."noctalia/palettes/stylix.json".text = builtins.toJSON {
        dark = {
          mPrimary = primary;
          mOnPrimary = stx.base00;
          mSecondary = secondary;
          mOnSecondary = stx.base00;
          mTertiary = tertiary;
          mOnTertiary = stx.base00;
          mError = stx.base08;
          mOnError = stx.base00;
          mSurface = stx.base00;
          mOnSurface = stx.base05;
          mHover = primary;
          mOnHover = stx.base00;
          mSurfaceVariant = stx.base01;
          mOnSurfaceVariant = stx.base04;
          mOutline = stx.base02;
          mShadow = stx.base00;
          terminal = {
            background = stx.base00;
            foreground = stx.base05;
            cursor = stx.base05;
            cursorText = stx.base00;
            selectionBg = stx.base02;
            selectionFg = stx.base05;
            normal = {
              black = stx.base00;
              red = stx.base08;
              green = stx.base0B;
              yellow = stx.base0A;
              blue = stx.base0D;
              magenta = stx.base0E;
              cyan = stx.base0C;
              white = stx.base05;
            };
            bright = {
              black = stx.base03;
              red = stx.base08;
              green = stx.base0B;
              yellow = stx.base0A;
              blue = stx.base0D;
              magenta = stx.base0E;
              cyan = stx.base0C;
              white = stx.base07;
            };
          };
        };
      };

      hm.programs.noctalia.settings.theme = {
        mode = "dark";
        source = "custom";
        custom_palette = "stylix";
      };
    };
}
