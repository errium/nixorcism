{
  flake.modules.nixos.gui_spicetify = {
    config,
    lib,
    ...
  }: let
    cfg = config.stylix.enable or false;
    stx = config.lib.stylix.colors.withHashtag;
  in {
    hm.stylix.targets.spicetify.colors.override = lib.mkIf cfg {
      base02 = stx.base00;
      base03 = stx.base00;
      base04 = stx.base01;
    };
  };
}
