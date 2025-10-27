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

        settings = {
          font.normal.family = "JetBrainsMono Nerd Font";
        };
      };

      home.packages = with pkgs; [
        nerd-fonts.jetbrains-mono
      ];
    };
  };
}
