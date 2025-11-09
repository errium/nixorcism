{
  inputs,
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    inputs.stylix.nixosModules.stylix
  ];

  options.nixorcism.stylix.enable = lib.mkEnableOption "Enable stylix";

  config = lib.mkIf config.nixorcism.stylix.enable {
    stylix = {
      enable = true;
      polarity = "dark";

      # Vague
      base16Scheme = {
        base00 = "141415"; # background
        base01 = "252530"; # lighter background (status bars, line number)
        base02 = "606079"; # selection background
        base03 = "606079"; # comments, invisibles
        base04 = "aeaed1"; # dark foreground (status bars)
        base05 = "cdcdcd"; # default foreground
        base06 = "d7d7d7"; # light foreground
        base07 = "d7d7d7"; # light background
        base08 = "d8647e"; # red
        base09 = "f3be7c"; # orange
        base0A = "f5cb96"; # yellow
        base0B = "7fa563"; # green
        base0C = "aeaed1"; # cyan
        base0D = "6e94b2"; # blue
        base0E = "bb9dbd"; # purple
        base0F = "e08398"; # brown/bright red
      };

      fonts = {
        serif = config.nixorcism.myFonts.serif;
        sansSerif = config.nixorcism.myFonts.sansSerif;
        monospace = config.nixorcism.myFonts.monospace;
        emoji = config.nixorcism.myFonts.emoji;

        sizes = {
          applications = 10;
          desktop = 10;
          popups = 10;
          terminal = 12;
        };
      };
    };

    hm.stylix = {
      enable = true;
      targets = {
        helix.enable = false;
        btop.enable = false;
      };
    };
  };
}
