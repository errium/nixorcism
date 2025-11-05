{
  pkgs,
  config,
  lib,
  ...
}: {
  options.nixorcism.packages.cli = {
    btop.enable = lib.mkEnableOption "Enables btop";
  };

  config = lib.mkIf config.nixorcism.packages.cli.btop.enable {
    hm = {
      programs.btop = {
        enable = true;
        package = pkgs.btop-cuda;

        settings = {
          # color_theme = "TTY";
          theme_background = false;
          rounded_corners = false;
          update_ms = 200;
        };
      };
    };
  };
}
