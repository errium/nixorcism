{
  config,
  inputs,
  lib,
  ...
}: {
  imports = [inputs.stylix.nixosModules.stylix];

  config = lib.mkIf config.nixorcism.misc.styling.enable {
    stylix = let
      colors = import ./colors.nix;
    in {
      enable = true;
      polarity = "dark";
      base16Scheme = colors.vague;
    };
  };
}
