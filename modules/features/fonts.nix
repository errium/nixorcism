{
  flake.modules.nixos.feature_fonts = {pkgs, ...}: let
    regular = with pkgs; [
      # For compatibility
      corefonts
      dejavu_fonts
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      unifont

      # My things
      rubik
    ];
    nerd-fonts = with pkgs.nerd-fonts; [
      symbols-only
    ];
  in {fonts.packages = regular ++ nerd-fonts;};
}
