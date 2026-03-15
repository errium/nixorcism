{
  flake.modules.nixos.editor_zed = {
    config,
    lib,
    ...
  }: let
    cfg = config.stylix.enable or false;
    stx = config.lib.stylix.colors.withHashtag;
  in {
    hm.programs.zed-editor.userSettings = lib.mkIf cfg {
      theme = lib.mkForce "Base16 untitled";
      ui_font_size = lib.mkForce 16;

      theme_overrides."Base16 untitled" = {
        "border" = stx.base00;
        "border.variant" = stx.base00;
        "editor.wrap_guide" = stx.base02;
        "hint" = stx.base03;
        "hint.background" = "${stx.base01}66";
        "panel.focused_border" = stx.base03;

        "error.background" = "${stx.base08}66";
        "info.background" = "${stx.base0D}66";
        "warning.background" = "${stx.base0A}66";
      };
    };
  };
}
