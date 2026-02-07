{
  config,
  lib,
  pkgs,
  ...
}: let
  regular = with pkgs; [
    dejavu_fonts
    inter
    liberation_ttf
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    rubik
  ];
  nerd-fonts = with pkgs.nerd-fonts; [
    iosevka-term
    symbols-only
  ];
in {
  fonts.packages = regular ++ nerd-fonts;

  stylix.fonts = lib.mkIf config.stylix.enable {
    sansSerif = {
      name = "Iosevka Medium Extended";
      package = pkgs.iosevka;
    };
    serif = {
      name = "Iosevka Medium Extended";
      package = pkgs.iosevka;
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
