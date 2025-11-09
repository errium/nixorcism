{
  inputs,
  config,
  lib,
  ...
}: {
  imports = [
    inputs.stylix.nixosModules.stylix
    ./stylixColors.nix
  ];

  options.nixorcism.stylix.enable = lib.mkEnableOption "Enable stylix";

  config = lib.mkIf config.nixorcism.stylix.enable {
    stylix = {
      enable = true;
      polarity = "dark";
      base16Scheme = config.nixorcism.stylixColors.vague;

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
      enable = true;
      targets = {
        btop.enable = false;
      };
    };
  };
}
