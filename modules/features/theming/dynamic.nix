{config, ...}: {
  flake.modules.nixos.theming_dynamic = {
    imports = with config.flake.modules.nixos; [
      theming_common
      theming_matugen
      theming_stylix
    ];

    stylix.base16Scheme = ./matugen/palette.yaml;
  };
}
