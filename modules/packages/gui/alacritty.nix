{
  config,
  lib,
  pkgs,
  ...
}: {
  options.nixorcism.packages.gui.alacritty = {
    enable = lib.mkEnableOption "Alacritty";
  };

  config = lib.mkIf config.nixorcism.packages.gui.alacritty.enable {
    hm = {
      programs.alacritty = {
        enable = true;
      };
    };
  };
}
