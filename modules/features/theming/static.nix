{
  flake.modules.nixos.theming_static = let
    colors = import ./stylix/_colors.nix;
  in {
    stylix.base16Scheme = colors.palette;
  };
}
