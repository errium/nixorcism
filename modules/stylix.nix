{
  inputs,
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    inputs.stylix.nixosModules.stylix
  ];

  options.nixorcism.stylix.enable = lib.mkEnableOption "Enable stylix";

  config = lib.mkIf config.nixorcism.stylix.enable {
    stylix = {
      enable = true;
      polarity = "dark";
      base16Scheme = "${pkgs.base16-schemes}/share/themes/kanagawa-dragon.yaml";

      fonts = {
        serif = config.nixorcism.myFonts.serif;
        sansSerif = config.nixorcism.myFonts.sansSerif;
        monospace = config.nixorcism.myFonts.monospace;
        emoji = config.nixorcism.myFonts.emoji;
      };
    };

    hm.stylix = {
      enable = true; # <- Idk why I need this, but shit breaks without it
      targets = {
        btop.enable = false;
        niri.enable = false;
      };
    };
  };
}
