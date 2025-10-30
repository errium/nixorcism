{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.nixorcism.desktop.niri.enable {
    hm = {
      programs.niri.settings.outputs = {
        eDP-1 = {
          mode = {
            width = 2560;
            height = 1600;
            refresh = 165.002;
          };
          scale = 1;
          variable-refresh-rate = true;
        };

        Virtual-1 = {
          mode = {
            width = 2048;
            height = 1152;
          };
          scale = 1;
        };
      };
    };
  };
}
