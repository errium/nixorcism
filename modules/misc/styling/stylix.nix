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

      base16Scheme = colors.palette;
      # image = ../../../assets/wallpaper.jpg;
      polarity = "dark";

      opacity = {
        terminal = 0.97;
      };
    };
  };
}
