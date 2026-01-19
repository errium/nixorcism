{
  config,
  lib,
  ...
}: {
  options.nixorcism.packages.cli.cava = {
    enable = lib.mkEnableOption "cava";
  };

  config = lib.mkIf config.nixorcism.packages.cli.cava.enable {
    hm.programs.cava = {
      enable = true;

      settings = {
        general.bar_width = 1;
        output = {
          channels = "mono";
          # xaxis = "frequency";
        };
      };
    };
  };
}
