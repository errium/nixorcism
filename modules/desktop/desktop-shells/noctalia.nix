{
  config,
  inputs,
  lib,
  ...
}: {
  options.nixorcism.desktop.desktop-shells.noctalia = {
    enable = lib.mkEnableOption "noctalia-shell";
  };

  config = lib.mkIf config.nixorcism.desktop.desktop-shells.noctalia.enable {
    hm = {
      imports = [inputs.noctalia.homeModules.default];
      programs.noctalia-shell = {
        enable = true;

        colors = lib.mkIf config.stylix.enable (with config.lib.stylix.colors.withHashtag; {
          mPrimary = base06;
          mOnPrimary = base00;
          mSecondary = base06;
          mOnSecondary = base00;
          mTertiary = base04;
          mOnTertiary = base00;
          mError = base08;
          mOnError = base00;
          mSurface = base00;
          mOnSurface = base06;
          mHover = base04;
          mOnHover = base00;
          mSurfaceVariant = base01;
          mOnSurfaceVariant = base04;
          mOutline = base02;
          mShadow = base00;
        });
      };
    };
  };
}
