{
  flake.modules.nixos.theming_stylix = {pkgs, ...}: {
    stylix.fonts = {
      sansSerif = {
        name = "IBM Plex Sans";
        package = pkgs.ibm-plex;
      };
      serif = {
        name = "IBM Plex Serif";
        package = pkgs.ibm-plex;
      };
      monospace = {
        name = "Lilex Nerd Font";
        package = pkgs.nerd-fonts.lilex;
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
  };
}
