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
    # sansSerif = {
    #   name = "PT Sans";
    #   package = pkgs.paratype-pt-sans;
    # };
    # serif = {
    #   name = "PT Serif";
    #   package = pkgs.paratype-pt-serif;
    # };
    # monospace = {
    #   name = "IosevkaTerm Nerd Font";
    #   package = pkgs.nerd-fonts.iosevka-term;
    # };

    # sansSerif = {
    #   name = "Fira Sans";
    #   package = pkgs.fira;
    # };
    # serif = {
    #   name = "Fira Sans";
    #   package = pkgs.fira;
    # };
    # monospace = {
    #   name = "FiraCode Nerd Font";
    #   package = pkgs.nerd-fonts.fira-code;
    # };

    sansSerif = {
      name = "Inter";
      package = pkgs.inter;
    };
    serif = {
      name = "Inter";
      package = pkgs.inter;
    };
    monospace = {
      name = "JetbrainsMono Nerd Font";
      package = pkgs.nerd-fonts.jetbrains-mono;
    };

    emoji = {
      name = "Noto Color Emoji";
      package = pkgs.noto-fonts-color-emoji;
    };

    sizes = {
      applications = 10;
      desktop = 10;
      popups = 10;
      terminal = 12;
    };
  };
}
