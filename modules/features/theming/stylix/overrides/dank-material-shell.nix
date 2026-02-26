{
  flake.modules.nixos.wm-utils_dank-material-shell = {
    config,
    lib,
    ...
  }: let
    cfg = config.stylix.enable or false;
    stx = config.lib.stylix.colors.withHashtag;

    primary = stx.base05;
    secondary = stx.base0E;
  in {
    hm.home.file.".config/DankMaterialShell/stylix.json".text = lib.mkIf cfg (builtins.toJSON {
      name = "Stylix";

      inherit primary secondary;
      primaryText = stx.base00;
      primaryContainer = stx.base0C;

      surface = stx.base00;
      surfaceTint = primary;
      surfaceText = stx.base05;
      surfaceVariant = stx.base01;
      surfaceVariantText = stx.base05;
      surfaceContainer = stx.base00;
      surfaceContainerHigh = stx.base01;
      surfaceContainerHighest = stx.base02;

      background = stx.base00;
      backgroundText = stx.base05;

      outline = stx.base02;

      error = stx.base08;
      warning = stx.base0A;
      info = primary;
    });
  };
}
