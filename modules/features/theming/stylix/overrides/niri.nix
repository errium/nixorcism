{
  flake.modules.nixos.wm_niri = {
    config,
    lib,
    ...
  }: let
    cfg = config.stylix.enable or false;
    stx = config.lib.stylix.colors.withHashtag;
  in {
    hm = {
      # This disables niri-flake’s built-in stylix module
      stylix.targets.niri.enable = false;

      programs.niri.settings.layout = lib.mkIf cfg {
        focus-ring = {
          active = {color = stx.base0A;};
          inactive = {color = stx.base01;};
          urgent = {color = stx.base08;};
        };

        border = {
          active = {color = stx.base0A;};
          inactive = {color = stx.base01;};
          urgent = {color = stx.base08;};
        };
      };
    };
  };
}
