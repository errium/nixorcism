{
  flake.modules.nixos.theming_stylix = {inputs, ...}: {
    imports = [inputs.stylix.nixosModules.stylix];

    stylix = {
      enable = true;
      polarity = "dark";
    };
  };
}
