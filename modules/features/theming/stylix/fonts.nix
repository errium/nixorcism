{
  flake.modules.nixos.theming_stylix = {pkgs, ...}: {
    stylix.fonts = {
      sansSerif = {
        name = "PT Sans";
        package = pkgs.paratype-pt-sans;
      };
      serif = {
        name = "PT Serif";
        package = pkgs.paratype-pt-serif;
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
  };
}
