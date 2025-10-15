{ pkgs, ... }:

{
  stylix.targets.helix.enable = false;
  stylix.targets.librewolf.enable = false;
  stylix.targets.vesktop.enable = false;
  stylix.targets.cava.rainbow.enable = true;
  stylix.targets.dunst.enable = false;

  stylix.fonts = {
    serif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Serif";
    };
    sansSerif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans";
    };
    monospace = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Nerd Font";
    };
    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };
  };

  stylix.fonts.sizes.applications = 0;
  stylix.fonts.sizes.desktop = 0;
  stylix.fonts.sizes.popups = 0;
  stylix.fonts.sizes.terminal = 0;
}
