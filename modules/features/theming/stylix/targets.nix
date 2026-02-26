{
  flake.modules.nixos.theming_stylix = {
    stylix.targets = {
      fontconfig.enable = false;
    };

    hm.stylix.targets = {
      fontconfig.enable = false;
      noctalia-shell.enable = false;
      sway.enable = false;
      vesktop.enable = false;

      librewolf = {
        colorTheme.enable = true;
        fonts.enable = false;
        profileNames = ["default"];
      };
    };
  };
}
