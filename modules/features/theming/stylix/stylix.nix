{
  # NOTE: `theming_stylix` is NOT meant to be imported manually
  flake.modules.nixos.theming_stylix = {inputs, ...}: {
    imports = [inputs.stylix.nixosModules.stylix];

    stylix = {
      enable = true;
      polarity = "dark";
    };
  };
}
