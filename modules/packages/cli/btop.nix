{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    nixDots.packages.cli.btop.enable = lib.mkEnableOption "Enables git";
  };

  config = lib.mkIf config.nixDots.packages.cli.btop.enable {
    hm.programs.btop = {
      enable = true;
      package = pkgs.btop-cuda;

      settings = {
        color_theme = "TTY";
        theme_background = false;
        rounded_corners = false;
      };
    };
  };
}
