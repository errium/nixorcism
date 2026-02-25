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
      main-elevated = stx.base01;
      sidebar = stx.base00;
      player = stx.base02;
      card = stx.base02;
      highlight = stx.base01;
      highlight-elevated = stx.base02;
      tab-active = stx.base01;
      selected-row = stx.base02;
    };
  };
}
