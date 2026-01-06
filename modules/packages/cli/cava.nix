{
  config,
  lib,
  ...
}: {
  options.nixorcism.packages.cli.cava = {
    enable = lib.mkEnableOption "cava";
  };

  config = lib.mkIf config.nixorcism.packages.cli.cava.enable {
    hm = {
      programs.cava = {
        enable = true;

        settings = {
          general.framerate = 60;
          general.bar_width = 1;
          general.center_align = true;
          output.method = "noncurses";
          output.orientation = "horizontal";
        };
      };
    };
  };
}
