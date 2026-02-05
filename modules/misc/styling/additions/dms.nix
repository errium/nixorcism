{
  config,
  lib,
  ...
}: let
  stx = config.lib.stylix.colors.withHashtag;
in {
  config = lib.mkIf (config.nixorcism.desktop.desktop-shells.dms.enable && config.stylix.enable) {
    hm.home.file.".config/DankMaterialShell/stylix.json".text = builtins.toJSON {
      name = "Stylix";
      primary = stx.base00;
    };
  };
}
