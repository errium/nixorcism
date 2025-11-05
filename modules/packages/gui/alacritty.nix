{
  config,
  lib,
  pkgs,
  ...
}: {
  options.nixorcism.packages.gui = {
    alacritty.enable = lib.mkEnableOption "Enables alacritty";
  };

  config = lib.mkIf config.nixorcism.packages.gui.alacritty.enable {
    hm = {
      programs.alacritty = {
        enable = true;

        theme = "oxocarbon";

        # settings = {
        #   font.normal.family = "IosevkaTerm Nerd Font";
        # };
      };

      home.packages = with pkgs; [
        nerd-fonts.iosevka-term
      ];
    };
  };
}
