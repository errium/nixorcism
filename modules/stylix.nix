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
      # base16Scheme = "${pkgs.base16-schemes}/share/themes/kanagawa-dragon.yaml";

      # Kanagawa Dragon
      base16Scheme = {
        base00 = "#181616";
        base01 = "#0d0c0c";
        base02 = "#2d4f67";
        base03 = "#a6a69c";
        base04 = "#7fb4ca";
        base05 = "#c5c9c5";
        base06 = "#938aa9";
        base07 = "#c5c9c5";
        base08 = "#c4746e";
        base09 = "#e46876";
        base0A = "#c4b28a";
        base0B = "#8a9a7b";
        base0C = "#8ea4a2";
        base0D = "#8ba4b0";
        base0E = "#a292a3";
        base0F = "#7aa89f";
      };

      fonts = {
        serif = config.nixorcism.myFonts.serif;
        sansSerif = config.nixorcism.myFonts.sansSerif;
        monospace = config.nixorcism.myFonts.monospace;
        emoji = config.nixorcism.myFonts.emoji;

        sizes = {
          applications = 10;
          desktop = 10;
          popups = 10;
          terminal = 10;
        };
      };
    };

    hm.stylix = {
      enable = true;
      targets = {
        btop.enable = false;
        niri.enable = false;
      };
    };
  };
}
