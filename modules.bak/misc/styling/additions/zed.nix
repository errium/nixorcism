{
  config,
  lib,
  ...
}: let
  stx = config.lib.stylix.colors.withHashtag;
in {
  config = lib.mkIf (config.nixorcism.packages.editors.zed.enable && config.stylix.enable) {
    hm.programs.zed-editor.userSettings.theme_overrides."Base16 untitled" = {
      hint = stx.base03;
      "hint.background" = stx.base01;
    };
  };
}
