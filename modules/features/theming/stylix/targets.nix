{
  flake.modules.nixos.theming_stylix = {
    stylix.targets = {
      fontconfig.enable = false;
    };

    hm.stylix.targets = {
      cava.rainbow.enable = true;
      fontconfig.enable = false;
      kitty.enable = false;
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
