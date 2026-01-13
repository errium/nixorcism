{
  config,
  lib,
  pkgs,
  ...
}: let
  regular = with pkgs; [
    dejavu_fonts
    liberation_ttf
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];
  nerd-fonts = with pkgs.nerd-fonts; [
    iosevka
    iosevka-term
  ];
in {
  fonts.packages = regular ++ nerd-fonts;

  stylix.fonts = lib.mkIf config.stylix.enable {
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

    sizes = {
      applications = 10;
      desktop = 10;
      popups = 10;
      terminal = 13;
    };
  };
}
