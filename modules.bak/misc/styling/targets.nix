{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.stylix.enable {
    stylix.targets = {
      fontconfig.enable = false;
    };

    hm.stylix.targets = {
      cava.rainbow.enable = true;
      fontconfig.enable = false;
      kitty.enable = false; # TEST
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
