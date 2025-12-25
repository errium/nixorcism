{
  inputs,
  config,
  lib,
  ...
}: {
  imports = [
    inputs.stylix.nixosModules.stylix
  ];

  options.nixorcism.misc = {
    stylix.enable = lib.mkEnableOption "Enable stylix";
  };

  config = lib.mkIf true {
    stylix = let
      stylixColors = import ./stylixColors.nix;
    in {
      enable = true;
      autoEnable = config.nixorcism.stylix.enable;

      polarity = "dark";
      base16Scheme = stylixColors.vague;

      fonts = {
        serif = config.nixorcism.myFonts.serif;
        sansSerif = config.nixorcism.myFonts.sansSerif;
        monospace = config.nixorcism.myFonts.monospace;
        emoji = config.nixorcism.myFonts.emoji;

        sizes = {
          applications = 10;
          desktop = 10;
          popups = 10;
          terminal = 12;
        };
      };
    };

    hm.stylix = {
      targets = {
        opencode.enable = false;
      };
    };
  };
}
