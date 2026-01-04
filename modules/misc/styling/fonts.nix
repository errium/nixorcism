{
  lib,
  pkgs,
  ...
}: let
  serif = {
    name = "Noto Serif";
    package = pkgs.noto-fonts;
  };
  sansSerif = {
    name = "Noto Sans";
    package = pkgs.noto-fonts;
  };
  monospace = {
    name = "IosevkaTerm Nerd Font";
    package = pkgs.nerd-fonts.iosevka-term;
  };
  emoji = {
    name = "Noto Color Emoji";
    package = pkgs.noto-fonts-color-emoji;
  };
in {
  options.nixorcism.myFonts = {
    serif = lib.mkOption {type = lib.types.attrs;};
    sansSerif = lib.mkOption {type = lib.types.attrs;};
    monospace = lib.mkOption {type = lib.types.attrs;};
    emoji = lib.mkOption {type = lib.types.attrs;};
  };

  config = {
    nixorcism.myFonts = {
      serif = serif;
      sansSerif = sansSerif;
      monospace = monospace;
      emoji = emoji;
    };

    fonts.packages = with pkgs; [
      dejavu_fonts
      liberation_ttf
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
    ];
  };
}
