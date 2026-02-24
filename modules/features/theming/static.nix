{config, ...}: {
  flake.modules.nixos.theming_static = {
    imports = with config.flake.modules.nixos; [theming_stylix];

    stylix.base16Scheme = let
      colors = import ./stylix/_colors.nix;
    in (colors.palette);
  };
}
