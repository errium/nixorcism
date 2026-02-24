{config, ...}: {
  flake.modules.nixos.theming_dynamic = {
    imports = with config.flake.modules.nixos; [
      theming_stylix
      theming_wallust
    ];

    stylix.base16Scheme = ./wallust/palette.yaml;
  };
}
