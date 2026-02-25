{
  flake.modules.nixos.wm-utils_noctalia = {
    config,
    lib,
    ...
  }: let
    cfg = (config.stylix.enable or false);
    stx = config.lib.stylix.colors.withHashtag;

    primary = stx.base05;
    secondary = stx.base04;
    tertiary = stx.base05;
  in {
    hm.programs.noctalia-shell.colors = lib.mkIf cfg {
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
    };
  };
}
